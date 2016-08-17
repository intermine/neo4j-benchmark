package org.intermine.neo4j.plugin.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Gene {
    private String primaryIdentifier;
    private String secondaryIdentifier;
    private String symbol;
    private String name;
    private LocatedOn location;
    private List<Gene> overlappingGenes = new ArrayList<Gene>();
    private Map<String, List<Gene>> orthologuesByDataSet = new java.util.HashMap<>();
    private List<String> goTermIdentifiers = new ArrayList<>();
    private Organism organism;
    public Gene() {
        super();
    }
    public Gene(String primaryIdentifier) {
        super();
        this.primaryIdentifier = primaryIdentifier;
    }
    public String getPrimaryIdentifier() {
        return primaryIdentifier;
    }
    public void setPrimaryIdentifier(String primaryIdentifier) {
        this.primaryIdentifier = primaryIdentifier;
    }
    public String getSecondaryIdentifier() {
        return secondaryIdentifier;
    }
    public void setSecondaryIdentifier(String secondaryIdentifier) {
        this.secondaryIdentifier = secondaryIdentifier;
    }
    public String getSymbol() {
        return symbol;
    }
    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public LocatedOn getLocation() {
        return location;
    }
    public void setLocation(LocatedOn location) {
        this.location = location;
    }
    public List<Gene> getOverlappingGenes() {
        return overlappingGenes;
    }
    public void setOverlappingGenes(List<Gene> overlappingGenes) {
        this.overlappingGenes = overlappingGenes;
    }
    public void addOverlappingGene(Gene overlappingGene) {
        overlappingGenes.add(overlappingGene);
    }
    public Map<String, List<Gene>> getOrthologuesByDataSet() {
        return orthologuesByDataSet;
    }
    public void setOrthologuesByDataSet(
            Map<String, List<Gene>> orthologuesByDataSet) {
        this.orthologuesByDataSet = orthologuesByDataSet;
    }
    public void addOrthologue(String dataSet, Gene orthologue) {
        if(orthologuesByDataSet.containsKey(dataSet)) {
            orthologuesByDataSet.get(dataSet).add(orthologue);
        } else {
            List<Gene> orthologues = new ArrayList<>();
            orthologues.add(orthologue);
            orthologuesByDataSet.put(dataSet, orthologues);
        }
    }
    public Organism getOrganism() {
        return organism;
    }
    public void setOrganism(Organism organism) {
        this.organism = organism;
    }
    public List<String> getGoTermIdentifiers() {
        return goTermIdentifiers;
    }
    public void setGoTermIdentifiers(List<String> goTermIdentifiers) {
        this.goTermIdentifiers = goTermIdentifiers;
    }
}
