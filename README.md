# A simple container for [BiRT](https://eclipse-birt.github.io/birt-website/) Runtime

### Use [BiRT Designer 4.14.0](https://download.eclipse.org/birt/updates/release/4.14.0/index.html) (birt-report-designer-all-in-one) to design and view your reports.


The .rptdesign files must be in the reports folder (generated when the container was created).

To acess the reports, use:<br>
`localhost:8080/frameset?__report=youreportname.rptdesign`<br>
or<br>
`localhost:8080/run?__report=youreportname.rptdesign`<br>
See more details in the [BiRT documentation](https://eclipse-birt.github.io/birt-website/docs/integrating/viewer-setup#testing-a-more-complex-report).

You can customize the home page by modifying the `index.jsp` file.
