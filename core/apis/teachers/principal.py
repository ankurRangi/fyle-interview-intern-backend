from flask import Blueprint
from core.apis import decorators
from core.apis.responses import APIResponse
from core.models.teachers import Teacher

from core.apis.teachers.schema import TeacherSchema

principal_assignments_resources_v1 = Blueprint('principal_assignments_resources_v1', __name__)

@principal_assignments_resources_v1.route('/teachers', methods=['GET'], strict_slashes=False)
@decorators.authenticate_principal
def list_teachers(p):
    """Returns list of all the teachers"""
    teachers_list = Teacher.get_teachers_list()
    teachers_list_dump = TeacherSchema().dump(teachers_list, many=True)
    return APIResponse.respond(data=teachers_list_dump)
