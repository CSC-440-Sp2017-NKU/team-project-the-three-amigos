class Course < ActiveRecord::Base
  validates :name, presence: true
  validates :section, presence: true
  require 'csv'
  belongs_to :user
  # Association link between course and users
  has_many :enrolled_courses
  has_many :users, :through => :enrolled_courses
  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^name_/
      # Simple sort on the name colums
      order("LOWER(courses.name) #{ direction }")
    end
  }
  scope :search_query, lambda { |query|
    # Searches the students table on the 'first_name' and 'last_name' columns.
    # Matches using LIKE, automatically appends '%' to each term.
    # LIKE is case INsensitive with MySQL, however it is case
    # sensitive with PostGreSQL. To make it work in both worlds,
    # we downcase everything.
    return nil  if query.blank?
  
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
  
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conds = 1
    where(
      terms.map { |term|
        "(LOWER(courses.name) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }
  filterrific(
    default_filter_params: { sorted_by: 'name' },
    available_filters: [
        :sorted_by,
        :search_query
    ]
  )
  def self.import(file)
      CSV.foreach(file.path, headers:true) do |row|
          Course.create! row.to_hash
      end
  end
  
end
