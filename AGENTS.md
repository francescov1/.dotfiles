# Global Agent Instructions

## Behavior

- Read existing code and match the patterns, conventions, and style already in the codebase before writing new code.
- Do not create files unless absolutely necessary. No READMEs, docs, or config files unless asked.
- Prefer editing existing files over creating new ones.

## Code style and structure

- Prefer simplicity over cleverness. Fewer files, fewer abstractions.
- Don't write overly defensive code. Don't add try/catches just to log and rethrow — let errors bubble up to top-level handlers. Only catch errors when there's actual recovery logic.
- Don't type cast or suppress type/lint errors unless there's a good reason or precedent in the codebase for this case. Always fix properly first. Only cast if the proper fix is overly complex and there's no existing type to use.
- NEVER support backwards compatibility or legacy properties unless asked. Assume all changes can be breaking.
- Avoid optional values and silent fallbacks. There should be one correct way of doing things. Fail fast. Prefer nulls over optionals for legitimately empty values.

## Testing

- Prefer equality checks over "contains" checks. Validate the entire output, not just parts of it.
- Hardcode expected results instead of building them with abstractions. Duplication in tests is fine — readability matters more.
- Put unit tests beside the code they test in a `tests` folder.

## Logging

- Create loggers with relevant default properties to associate logs to resources (eg generationId, trainingJobId, teamId). Don't overdo it — stick to main identifiers.
- Add relevant logs throughout code to make debugging easier. Someone reading the logs should understand what steps a function took and where it errored.

```typescript
const logger = this.logger.child("launchTrainingJob", {
  trainingJobId: input.trainingJobId,
  teamId: input.teamId,
});

if (job.status !== "queued") {
  logger.warn("Skipping launch: job is no longer queued", {
    status: job.status,
  });
  return;
}

const config = TrainingConfigSchema.parse(job.trainingConfig);

const jobNodes = await trainingJobNodeStore.listNodesByJobId(...);

const nodeLaunchRequests = buildNodeLaunchRequests(...);

if (nodeLaunchRequests.length === 0) {
  throw new Error("No launch requests generated for training job");
}

logger.debug("Launching training job");

const launchResult = await providerPlugin.launchTrainingRun(...;

logger.info("Training job launched");

await trainingJobStore.updateTrainingJobStatus(...);
```

## Comments

- Do not add comments explaining why you removed or changed something. Only add comments that enhance understanding of the current code.
- Do not add comments that merely narrate what code does. Only comment non-obvious intent or constraints.

## Infrastructure

- NEVER run destructive commands against live resources (no writes, deletes, or updates). This includes DBs, Kubernetes, Helm, buckets, etc.
