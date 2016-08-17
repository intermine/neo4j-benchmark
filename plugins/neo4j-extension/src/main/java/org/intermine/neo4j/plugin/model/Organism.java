package org.intermine.neo4j.plugin;

public class Organism {
    private String shortName;
    private String taxonId;
    private String genus;
    private String commonName;
    private String species;
    private String name;

    public Organism() {
        super();
    }
    public Organism(String name) {
        super();
        this.name = name;
    }
    public String getShortName() {
        return shortName;
    }
    public void setShortName(String shortName) {
        this.shortName = shortName;
    }
    public String getTaxonId() {
        return taxonId;
    }
    public void setTaxonId(String taxonId) {
        this.taxonId = taxonId;
    }
    public String getGenus() {
        return genus;
    }
    public void setGenus(String genus) {
        this.genus = genus;
    }
    public String getCommonName() {
        return commonName;
    }
    public void setCommonName(String commonName) {
        this.commonName = commonName;
    }
    public String getSpecies() {
        return species;
    }
    public void setSpecies(String species) {
        this.species = species;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
