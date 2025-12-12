# Global Context

## Workstation Configuration

Shell and tooling configuration is managed in code via the dotfiles repo:
`~/src/github/dhudec/dotfiles`

**When making configuration changes** (shell aliases, environment variables, git config, iTerm2 settings, k9s skins, etc.), update the dotfiles repo rather than editing files directly in `$HOME`. Run `./install.sh` to apply changes via symlinks.

## Developer Environment

### Tool Management
- **Homebrew**: Primary package manager for CLI tools and GUI apps
- **asdf**: Version manager for runtimes (Go 1.23.11, Node 21.6.0, Python 3.10.8, Java openjdk-17)

### Key CLI Tools
- **Cloud/DevOps**: awscli, kubectl, k9s, helm, terraform, sops
- **Development**: gh, git, jq, yarn
- **Scripting**: Bash for simple tasks, Node for complex tasks (rarely Python)
- **Testing**: k6 (performance), bruno (API testing, collections in `~/src/github/dhudec/bruno-collections`)
- **Security**: gnupg, 1password-cli, cloudflared

## Git Workflow

Trunk-based development with `master` as the main branch.

**Branch naming:**
- `ENG-123` - Linear ticket (preferred when available)
- `feat/<description>` - Feature without ticket
- `fix/<description>` - Bug fix without ticket

## Runtime Version Management

Use `.tool-versions` in each repo to pin asdf-managed runtimes. Example:

```
nodejs 20.19.4
yarn 1.22.22
```

Infer the appropriate tools and versions from each repo's context (package.json, go.mod, etc.). Run `asdf install` to install pinned versions.

## Code Organization

All code lives in `~/src/`:

```
~/src/
├── github/                    # GitHub repos organized by org/repo
│   ├── basis-theory/          # Main work organization
│   ├── basis-theory-labs/     # Experiments
│   ├── dhudec/                # Personal repos
│   └── [other orgs]/          # Third-party/forked repos
│
└── sandbox/                   # Experimental/scratch projects
```

## Development Workflow

### Test-Driven Development

Prefer test-driven development approaches:
- **ATDD (Acceptance Test-Driven Development)**: Write acceptance tests before implementation
- **Acceptance Tests First**: When implementing new features, consider writing an acceptance test that fails, then implement code to make it pass
- **BDD Style**: Use behavior-driven development style tests that describe expected behavior
- **Not Just Unit Tests**: Focus on acceptance tests and integration tests that validate real functionality

Example workflow:
1. Write acceptance test describing desired behavior (it fails)
2. Implement minimal code to make test pass
3. Refactor while keeping tests green
4. Review code quality and requirements conformance

### Specialized Agent Usage

**Core Principles**:
1. **Use tech-lead for non-trivial development** - Always orchestrate complex work through tech-lead agent
2. **Run agents in parallel** - Launch multiple agents concurrently whenever possible
3. **Use solver for errors** - Systematic investigation for test failures, CI errors, runtime issues
4. **Synthesize agent feedback** - Combine perspectives pragmatically for optimal solutions

Use specialized agents at key points in the development workflow:


#### Orchestration and Parallel Development

**CRITICAL: Use tech-lead for all non-trivial development tasks**

For any substantial development work, ALWAYS use the tech-lead agent to orchestrate:
- Features spanning multiple domains (API + DB + infrastructure)
- Large refactorings touching many files
- Multi-step implementations requiring coordination
- Work that can benefit from parallel development
- Complex features requiring specialized expertise in different areas

Example:
```
User: "Implement JWT authentication with API handlers, DB models, and middleware"
Assistant: *Launches tech-lead agent immediately*
- Tech-lead breaks down into parallel workstreams
- Creates git worktrees for isolated development
- Delegates to specialized coding agents working in parallel
- Coordinates integration and ensures quality review
```

**Don't use tech-lead for**:
- Simple single-file changes
- Trivial bug fixes
- Documentation-only changes
- Read-only exploration tasks

#### Debugging and Error Resolution

**Use solver agent for systematic error investigation**

When encountering errors, test failures, or unexpected behavior, use the solver agent:
- **Test Failures**: Unit, integration, or acceptance tests failing in CI or locally
- **CI/CD Errors**: Build failures, deployment errors, pipeline issues
- **Runtime Errors**: Exceptions, crashes, unexpected behavior in production
- **Intermittent Failures**: Flaky tests or sporadic errors
- **Environment-Specific Issues**: Works locally but fails elsewhere

Example:
```
CI Output: "IntegrationTest.testAuthentication failed - Connection timeout"
Assistant: *Launches solver agent*
- Systematically investigates root cause
- Traces execution path to failure
- Implements robust fix with tests
- Verifies fix across all environments
```

**Debugger vs Regular Development**:
- Use solver when something is broken or failing
- Use tech-lead for building new features
- Use general agents for straightforward tasks

#### Planning Phase

**When creating or editing PRDs, plans, or feature specifications:**

Run these **three agents in parallel** to validate the plan:
- **pm-karen**: Ensure plan meets requirements without hallucinations
- **coach-randy**: Ensure plan is the bare minimum needed with no over-engineering
- **the-architect**: Research AWS best practices and ensure appropriate engineering (avoiding both over-simplification and over-engineering)

Example:
```
User: "I've written a PRD for the new authentication service using Lambda and DynamoDB"
Assistant: *Launches pm-karen, coach-randy, and the-architect in parallel*
- Karen validates the plan meets actual requirements
- Randy ensures we're not over-engineering and identifies MVP
- Architect researches AWS best practices and validates architectural decisions
```

**Synthesizing Agent Feedback:**

After agents complete their reviews:
1. **Combine perspectives pragmatically** - balance simplicity (Randy), requirements (Karen), and best practices (Architect)
2. **Find the middle ground** - consider all three viewpoints and choose the most balanced approach
3. **Escalate critical disagreements** - if agents have extreme differences of opinion on important decisions, present the conflict to the user as independent arbiter
4. **Two-way door bias** - when agents disagree on reversible decisions, prefer the simpler approach; for one-way doors, favor researched best practices

Example synthesis:
- Randy: "Just use a single Lambda, don't over-complicate"
- Architect: "Research shows we need dead letter queues and idempotency for reliability"
- Karen: "Requirements don't explicitly mention reliability SLAs"
- **Decision**: Implement DLQ (low complexity, high value) but defer advanced patterns until requirements demand them

**Flag extreme disagreements like:**
- Randy: "This is massive over-engineering"
- Architect: "This is critical for production reliability per AWS Well-Architected Framework"
- **Action**: Present both perspectives to user for final decision on the trade-off

#### Implementation Phase

**Test-Driven Development:**
- Write acceptance test first (where applicable)
- Implement minimal code to pass test
- Keep tests green during refactoring

#### Task Completion

**After completing any task, run quality checks in parallel:**

Launch these agents concurrently:
- **pm-karen**: Verify implementation meets requirements without hallucinations
- **uncle-bob**: Review code quality, SOLID principles, Clean Code adherence
- **coach-randy**: Ensure we did the bare minimum without over-engineering

Example:
```
Assistant: "I've completed the user authentication feature"
Assistant: *Launches pm-karen, uncle-bob, and coach-randy in parallel*
- Karen verifies requirements are met
- Uncle Bob reviews code craftsmanship
- Randy confirms no over-engineering
```

**Only proceed with "done" status after all three agents approve.**

#### When to Use Each Agent

**uncle-bob** - Use for code quality review:
- After implementing significant features
- After refactoring
- When code quality is questioned
- To ensure SOLID principles and Clean Code practices
- Focus: Code craftsmanship, maintainability, professional standards

**pm-karen** - Use for requirements verification:
- After claiming task completion
- When validating implementations
- To verify no hallucinations occurred
- To ensure specifications are met
- To validate edge cases are handled
- Focus: Requirements conformance, specification adherence, truth validation

**coach-randy** - Use for simplicity enforcement:
- During planning to identify MVP
- When evaluating implementation approaches
- To challenge over-engineering
- To find simpler alternatives
- When scope needs trimming
- To validate bare minimum approach
- Focus: Simplicity, MVP identification, anti-over-engineering

**the-architect** - Use for AWS architectural validation:
- During planning to validate AWS architectural decisions
- When designing cloud infrastructure or services
- To research AWS best practices and Well-Architected Framework
- To ensure solutions are appropriately engineered (not over- or under-engineered)
- To evaluate scalability, reliability, and failover strategies
- To identify edge cases and failure modes
- To ensure two-way doors on architectural decisions
- Focus: Research-backed AWS best practices, balanced engineering, production reliability

**tech-lead** - Use for orchestrating complex development:
- For ALL non-trivial development tasks
- Features spanning multiple domains or files
- Large refactorings or multi-step implementations
- Work that benefits from parallel development
- To coordinate multiple coding agents using git worktrees
- To ensure comprehensive quality review (Karen, Bob, Randy, Architect)
- Focus: Parallel orchestration, git worktree management, quality synthesis, accountability

**solver** - Use for systematic error investigation:
- When tests fail (unit, integration, acceptance)
- When CI/CD pipelines error (build, deploy failures)
- When runtime errors occur (exceptions, crashes)
- For intermittent or flaky test failures
- For environment-specific issues (works locally, fails in CI/prod)
- For performance problems (timeouts, memory leaks)
- Focus: Root cause analysis, systematic investigation, robust fixes
#### Agent Collaboration Pattern

**Standard Review Pattern** (run in parallel):
```bash
# After task completion
pm-karen  # Verify requirements met
uncle-bob       # Review code quality
coach-randy     # Check for over-engineering
```

**Planning Pattern** (run in parallel):
```bash
# When creating/editing plans or PRDs
pm-karen    # Validate plan meets requirements
coach-randy       # Ensure MVP and simplicity
the-architect   # Research AWS best practices and validate architecture
```

**Architecture Decision Pattern** (run in parallel):
```bash
# When choosing between approaches
coach-randy       # Identify simplest approach
the-architect   # Research best practices and evaluate trade-offs
uncle-bob         # Evaluate code architectural quality (if implementation exists)
```

### Quality Gates

**Before marking any task "complete":**
1. Implementation exists and works
2. Acceptance tests pass (if applicable)
3. pm-karen confirms requirements met
4. uncle-bob approves code quality
5. coach-randy confirms no over-engineering

**Before finalizing any plan:**
1. Requirements are clear and specific
2. pm-karen validates plan meets needs
3. coach-randy confirms MVP approach with no bloat
4. the-architect validates AWS architecture and engineering balance
5. Agent perspectives are synthesized pragmatically into balanced approach
6. Critical disagreements are escalated to user for arbitration

### Agent Review Guidelines

**Always run agents in parallel when possible** to maximize efficiency.

**Trust agent feedback** but use judgment:
- If agents disagree, investigate and understand why
- Balance code quality (uncle-bob) with simplicity (coach-randy)
- Requirements (sylvia) always take precedence
- Use coach-randy to challenge assumptions and scope

**Agent priorities:**
1. **pm-karen**: Requirements must be met (highest priority)
2. **the-architect**: Architecture must be appropriately engineered for production (research-backed)
3. **uncle-bob**: Code must be maintainable and professional
4. **coach-randy**: Solution must be appropriately simple (not over-engineered, not under-engineered)

**Note:** When Architect and Randy disagree, find the pragmatic middle ground that satisfies production needs without unnecessary complexity. Escalate fundamental disagreements to user.
