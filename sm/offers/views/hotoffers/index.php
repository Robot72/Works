<section class="section-light section-top-shadow">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-12 col-lg-6">
                        <h5 class="subtitle-margin">apartments for sale, colorodo, usa</h5>
                        <h1>42 estates found<span class="special-color">.</span></h1>
                    </div>
                    <!--
                    <div class="col-xs-12 col-lg-6">
                        <div class="view-icons-container">
                            <a class="view-box view-box-active"><img src="images/grid-icon.png" alt="" /></a>
                            <a class="view-box" href="listing-list-right-sidebar.html"><img src="images/list-icon.png" alt="" /></a>
                        </div>
                        <div class="order-by-container">
                            <select name="sort" class="bootstrap-select" title="Order By:">
                                <option>Price low to high</option>
                                <option>Price high to low</option>
                                <option>Area high to low</option>
                                <option>Area high to low</option>
                            </select>
                        </div>
                    </div>
                    -->
                    <div class="col-xs-12">
                        <div class="title-separator-primary"></div>
                    </div>
                    <div class="col-xs-12">
                        <div class="masonry-grid masonry-offers margin-top-60">
                            <!-- width of .grid-sizer used for columnWidth -->
                            <div class="masonry-grid-sizer"></div>
                            <?php foreach($models as $model) { ?>
                            <div class="masonry-grid-item">
                                <a href="<?= $model->nomer_po_baze ?>" class="zoom-cont2">
                                    <div class="grid-offer-photo">
                                        <img src="<?php // $model->getPhoto('') ?>" alt="" class="zoom" />
                                        <div class="type-container">
                                            <div class="estate-type">house</div>
                                            <div class="transaction-type">sale</div>
                                        </div>
                                    </div>
                                    <div class="grid-offer-text">
                                        <i class="fa fa-map-marker grid-offer-localization"></i>
                                        <div class="grid-offer-h4"><h4 class="grid-offer-title"><?= $model->title ?></h4></div>
                                        <div class="clearfix"></div>
                                        <p><?= $model->kommentariy ?></p>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="price-grid-cont">
                                        <div class="grid-price-label pull-left">Price:</div>
                                        <div class="grid-price pull-right">
                                            $ <?= $model->cena ?>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="grid-offer-params">
                                        <div class="grid-area">
                                            <img src="images/area-icon.png" alt="" /><?= $model->ploshad_o ?>m<sup>2</sup>
                                        </div>
                                        <div class="grid-rooms">
                                            <img src="images/rooms-icon.png" alt="" /><?= $model->komnat_vsego ?>
                                        </div>
                                        <div class="grid-baths">
                                            <img src="images/bathrooms-icon.png" alt="" /><?= $model->god_postrojki ?>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </a>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>>
