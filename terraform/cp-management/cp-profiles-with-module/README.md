## Advanced Pattern



| Pros |
| ---- |
| Reduces code duplication |
| Adding or removing versions is a low complexity task|
| Managing versions is an isolated task and does not impact other resources except clusters consuming the specific version |
| Accidental changes are less likely to occur |
| Flexible and allows future changes to be made with minimal impact to existing code |


| Cons |
| ---- |
| Increased complexity that is offloaded to the module |
| May be fifficult to understand |
| YAML customization requires additional logic to support |
| Removing a version requires using the command `terraform destroy -target` where the specific version module is targeted. |

