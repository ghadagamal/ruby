json.array!(@lectures) do |lecture|
  json.extract! lecture, :id, :title, :attach, :course_id
  json.url lecture_url(lecture, format: :json)
end
