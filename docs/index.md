---
static_meta_var: 'works!'
---

# Magnificent Title

This is in the Markdown content enhanced with the Macros plugin. Static means it can be edited by human in a file:

- Printing `static_extra_var`: {{ static_extra_var }}
- Printing `static_meta_var`: {{ static_meta_var }}

Dynamic means it's set by a Python code:

- Printing `dynamic_macros_var`: {{ dynamic_macros_var }}
- Printing `dynamic_extra_var`: {{ dynamic_extra_var }}
- Printing `dynamic_meta_var`: {{ dynamic_meta_var }}  

Shell environment:  

- Printing `MULTI_ENV_VARIABLE`: {{ MULTI_ENV_VARIABLE }}
- Printing `ENV_SPECIFIC_VARIABLE`: {{ ENV_SPECIFIC_VARIABLE }}
- Printing `DATA_CENTER_SPECIFIC_VARIABLE`: {{ DATA_CENTER_SPECIFIC_VARIABLE }}