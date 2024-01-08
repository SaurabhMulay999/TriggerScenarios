```
data Model:;
Tables given as below::
 Opportunity:
    field: Product Category (Datatype: Picklist)
        field values:
            1.Mobiles
            2.household

  Product:          
    field: product category (Datatype: Picklist)
        field value:
            1.Mobiles
            2.household

   OppLineItem:


Note: Product added to an opportunity becomes opportunityLineItem.

Scenario:
prevent insersion of line item record if product category field
of lineitem/product object ain't similar or match.

Resolution:

Trigger will be on insersion of opportunity line item,
So it will be in before event becuase need to prevent insertion.
```