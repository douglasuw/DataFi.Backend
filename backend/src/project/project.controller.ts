import { Crud, CrudController } from "@nestjsx/crud";

import { Controller } from "@nestjs/common";
import { Project } from "./entities/project.entity";
import { ProjectService } from "./project.service";

@Crud({
  model: {
    type: Project,
  },
})
@Controller("projects")
export class ProjectController implements CrudController<Project> {
  constructor(public service: ProjectService) {}
}