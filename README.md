# WidgetSaas
### Demonstration of the Apartmentex SaaS library

This is probably the smallest, simplest SaaS-architecture app ever.  

To start your TenantSaaS app:

  1. Add apartmentex dependency as instructed in apartmentex readme
  2. Fetch and compile dependencies with  mix deps.get && mix deps.compile
  2. Create and migrate your main/public database with `mix ecto.create && mix ecto.migrate` - this 
  gives you your tenants table in the main schema/database
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000/tenants`](http://localhost:4000/tenants) from your browser. Adding a tenant will cause a schema
or database to be created for the new tenant, and the widget_types and widgets tables migrated.  Both widgets and widget types have indexes
on 'name', and in widgets, 'widget_type_id' references the widget_types table.   

After creating your first tenant, visiting [`localhost:4000/tenants/1/widgets`] will allow you to view, add, 
and delete the widgets in tenant one's schema or database.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix