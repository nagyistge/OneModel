<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="a" uri="http://www.w3.org/2005/Atom"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <sch:pattern>
    <sch:title>RiskAssessment</sch:title>
    <sch:rule context="/f:RiskAssessment/f:subject">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:condition">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:performer">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:identifier/f:period">
      <sch:assert test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">Inv-1: If present, start SHALL have a lower value than end</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:identifier/f:assigner">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:method">
      <sch:assert test="count(f:coding[f:primary/@value='true'])&lt;=1">Inv-2: Only one coding in a set can be chosen directly by the user</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:method/f:coding">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:method/f:coding/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:basis">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:outcome">
      <sch:assert test="count(f:coding[f:primary/@value='true'])&lt;=1">Inv-2: Only one coding in a set can be chosen directly by the user</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:outcome/f:coding">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:outcome/f:coding/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:probabilityDecimal">
      <sch:assert test="@value &lt;= 100">Inv-2: Must be &lt;= 100</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:probabilityRange">
      <sch:assert test="(not(f:low) or f:low[f:code/@value='%' and f:system/@value='http://unitsofmeasure.org']) and (not(f:high) or f:high[f:code/@value='%' and f:system/@value='http://unitsofmeasure.org'])">Inv-1: low and high must be percentages, if present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:probabilityRange">
      <sch:assert test="not(exists(f:low/f:comparator) or exists(f:high/f:comparator))">Inv-3: Quantity values cannot have a comparator when used in a Range</sch:assert>
      <sch:assert test="not(exists(f:low/f:value/@value)) or not(exists(f:high/f:value/@value)) or (number(f:low/f:value/@value) &lt;= number(f:high/f:value/@value))">Inv-2: If present, low SHALL have a lower value than high</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:probabilityRange/f:low">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:probabilityRange/f:high">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:probabilityCodeableConcept">
      <sch:assert test="count(f:coding[f:primary/@value='true'])&lt;=1">Inv-2: Only one coding in a set can be chosen directly by the user</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:probabilityCodeableConcept/f:coding">
      <sch:assert test="not (exists(f:valueSet) and exists(f:code)) or exists(f:system)">Inv-1: If a valueSet is provided, a system URI Is required</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:probabilityCodeableConcept/f:coding/f:valueSet">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::a:content/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')]|/f:*/f:contained/f:*[@id=substring-after(current()/f:reference/@value, '#')])">Inv-1: SHALL have a local reference if the resource is provided inline</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:whenPeriod">
      <sch:assert test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">Inv-1: If present, start SHALL have a lower value than end</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:whenRange">
      <sch:assert test="not(exists(f:low/f:comparator) or exists(f:high/f:comparator))">Inv-3: Quantity values cannot have a comparator when used in a Range</sch:assert>
      <sch:assert test="not(exists(f:low/f:value/@value)) or not(exists(f:high/f:value/@value)) or (number(f:low/f:value/@value) &lt;= number(f:high/f:value/@value))">Inv-2: If present, low SHALL have a lower value than high</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:whenRange/f:low">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
    <sch:rule context="/f:RiskAssessment/f:prediction/f:whenRange/f:high">
      <sch:assert test="not(exists(f:code)) or exists(f:system)">Inv-3: If a code for the units is present, the system SHALL also be present</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
