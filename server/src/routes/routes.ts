import { Router } from "express";
import helloRouter from "./hellorouter";
import openAiRouter from "./open_ai_router";




const router = Router();

router.use("/hello", helloRouter)
router.use("/generate_response", openAiRouter);

export default router;