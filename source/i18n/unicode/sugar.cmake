# This file generated automatically by:
#   generate_sugar_files.py
# see wiki for more info:
#   https://github.com/ruslo/sugar/wiki/Collecting-sources

if(DEFINED ICU_SOURCE_I18N_UNICODE_SUGAR_CMAKE_)
  return()
else()
  set(ICU_SOURCE_I18N_UNICODE_SUGAR_CMAKE_ 1)
endif()

include(sugar_files)

sugar_files(
    ICU_I18N_SOURCES
    basictz.h
    bms.h
    bmsearch.h
    calendar.h
    choicfmt.h
    coleitr.h
    coll.h
    colldata.h
    curramt.h
    currpinf.h
    currunit.h
    datefmt.h
    dcfmtsym.h
    decimfmt.h
    dtfmtsym.h
    dtitvfmt.h
    dtitvinf.h
    dtptngen.h
    dtrule.h
    fieldpos.h
    fmtable.h
    format.h
    fpositer.h
    gregocal.h
    locdspnm.h
    measfmt.h
    measunit.h
    measure.h
    msgfmt.h
    numfmt.h
    numsys.h
    plurfmt.h
    plurrule.h
    rbnf.h
    rbtz.h
    regex.h
    search.h
    selfmt.h
    simpletz.h
    smpdtfmt.h
    sortkey.h
    stsearch.h
    tblcoll.h
    timezone.h
    tmunit.h
    tmutamt.h
    tmutfmt.h
    translit.h
    tzrule.h
    tztrans.h
    ucal.h
    ucol.h
    ucoleitr.h
    ucsdet.h
    ucurr.h
    udat.h
    udatpg.h
    uldnames.h
    ulocdata.h
    umsg.h
    unirepl.h
    unum.h
    uregex.h
    usearch.h
    uspoof.h
    utmscale.h
    utrans.h
    vtzone.h
)
