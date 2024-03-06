import { Router, Request, Response } from "express";
import { generateOpenAiResponsesController } from "../controllers/generate_openai_controller";


const openAiRouter = Router();

openAiRouter.post("/", generateOpenAiResponsesController);

export default openAiRouter;