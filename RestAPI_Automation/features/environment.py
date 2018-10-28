import ipdb


def setup_debug_on_error(userdata):
    global BEHAVE_DEBUG_ON_ERROR
    BEHAVE_DEBUG_ON_ERROR = userdata.getbool("BEHAVE_DEBUG_ON_ERROR")


def before_all(context):
    setup_debug_on_error(context.config.userdata)
    context.headers = {}
    context.config.setup_logging()


def after_step(context, step):
    if BEHAVE_DEBUG_ON_ERROR and step.status == "failed":
        ipdb.post_mortem(step.exc_traceback)


