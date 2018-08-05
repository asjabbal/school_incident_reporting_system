class UserDetail < ApplicationRecord
	STUDENT = "student".freeze
	TEACHER = "teacher".freeze
	OTHER_STAFF = "other_staff".freeze
	PARENT = "student_parent".freeze
	COMMUNITY_MEMBER = "community_member".freeze

	ROLES = [STUDENT, TEACHER, OTHER_STAFF, PARENT, COMMUNITY_MEMBER]

	enum role: ROLES
  belongs_to :incident
end
