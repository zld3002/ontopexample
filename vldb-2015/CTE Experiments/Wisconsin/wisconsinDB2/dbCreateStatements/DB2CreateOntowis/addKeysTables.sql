connect to wisc100m;

ALTER TABLE DB2INST2."Tab1" ADD CONSTRAINT tab1_pkey PRIMARY KEY ("unique2Tab1");
ALTER TABLE DB2INST2."Tab2" ADD CONSTRAINT tab2_pkey PRIMARY KEY ("unique2Tab2");
ALTER TABLE DB2INST2."Tab3" ADD CONSTRAINT tab3_pkey PRIMARY KEY ("unique2Tab3");
ALTER TABLE DB2INST2."Tab4" ADD CONSTRAINT tab4_pkey PRIMARY KEY ("unique2Tab4");
ALTER TABLE DB2INST2."Tab5" ADD CONSTRAINT tab5_pkey PRIMARY KEY ("unique2Tab5");

ALTER TABLE DB2INST2."Tab0" ADD CONSTRAINT tab0_pkey PRIMARY KEY ("unique2Tab0");

connect reset;