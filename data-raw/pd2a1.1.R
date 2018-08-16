library(elmr)
pd2a1.1=read.neurons.catmaid("name:pd2a1#1")

# find points inside LH using LH bounding box
# since otherwise we miss a few
lhr=as.mesh3d(subset(FAFBNP.surf, "LH_R"))
bb=boundingbox(lhr)
pp=pointsinside(connectors(pd2a1.1), bb)
points3d(xyzmatrix(connectors(pd2a1.1)), col=ifelse(pp, 'red', 'grey'))
plot3d(boundingbox(lhr))

pd2a1.1_upstream=catmaid_get_connector_table("name:pd2a1#1",direction = 'incoming')
library(dplyr)
pd2a1.1_upstream %>%
  mutate(inlh=pointsinside(cbind(x,y,z), bb)) %>%
  mutate(last_modified=anytime::anytime(pd2a1.1_upstream$last_modified, asUTC = T)) ->pd2a1.1_upstream
str(pd2a1.1_upstream)

pd2a1.1.sc=samplingcurve(pd2a1.1_upstream$partner_skid)

devtools::use_data(pd2a1.1.sc)
