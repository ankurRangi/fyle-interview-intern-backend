from marshmallow import Schema, EXCLUDE, fields, post_load
from marshmallow_sqlalchemy import SQLAlchemyAutoSchema, auto_field
from core.models.teachers import Teacher
from core.libs.helpers import GeneralObject


class TeacherSchema(SQLAlchemyAutoSchema):
    class Meta:
        model = Teacher
        unknown = EXCLUDE   # Exclude unknown fields from the input data

    created_at = auto_field(dump_only=True)
    id = auto_field(required=False, allow_none=True)
    updated_at = auto_field(dump_only=True)
    user_id = auto_field(dump_only=True)

    # Function to access the data after it has be deserialize
    # It will create a model instance automatically
    @post_load
    def initiate_class(self, data_dict, many, partial):
        return GeneralObject(**data_dict)


