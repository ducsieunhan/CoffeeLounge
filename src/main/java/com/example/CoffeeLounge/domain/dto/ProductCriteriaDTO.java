package com.example.CoffeeLounge.domain.dto;

import java.lang.StackWalker.Option;
import java.util.Optional;

public class ProductCriteriaDTO {
    private Optional<String> page;
    private Optional<String> name;
    private Optional<String> category;
    private Optional<String> sort;
    private Optional<String> min;
    private Optional<String> max;

    public Optional<String> getMin() {
        return min;
    }

    public void setMin(Optional<String> min) {
        this.min = min;
    }

    public Optional<String> getMax() {
        return max;
    }

    public void setMax(Optional<String> max) {
        this.max = max;
    }

    public Optional<String> getPage() {
        return page;
    }

    public void setPage(Optional<String> page) {
        this.page = page;
    }

    public Optional<String> getName() {
        return name;
    }

    public void setName(Optional<String> name) {
        this.name = name;
    }

    public Optional<String> getCategory() {
        return category;
    }

    public void setCategory(Optional<String> category) {
        this.category = category;
    }

    public Optional<String> getSort() {
        return sort;
    }

    public void setSort(Optional<String> sort) {
        this.sort = sort;
    }

}
