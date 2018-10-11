Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4586EE00A54; Thu, 11 Oct 2018 11:47:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E038E00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:47:54 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id z21-v6so9196346ljz.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sqeCigLojrZEV7Zt6eS8859qrKyuk4a9hWaowH5nHpo=;
	b=YnCqqKqZ6M34nZIjqJygSJ0dAi4gLENlbcKSSOehzrbdRJMrpmqhMAXosDu8FrnQAb
	/FjGaYy6hF46tltehAhx/iyr8qstdI1IkGlvhCHixQDtJOltOpy7QlxJWg+EKpXQlfkI
	WeU1oopKpk988BxpAtmbFPLy8F/T14d1c669hNir98IkVyozf4qDX6i+YASggs8qhjeF
	/t2yVv4TxWpOD+/+Qw++slPjCoHRlJaDVbCnCKw3qeDCBJ4D5BVHvMFGRtmQWNcM+c/E
	+Rt4u4saxO2zn+ptDeWFhAGiomk67xCuxYRqx2USZ6PtJ06wDGJQL77fI0sRBaL7DEP6
	tNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sqeCigLojrZEV7Zt6eS8859qrKyuk4a9hWaowH5nHpo=;
	b=Kegeuf/La80hF3rx8hIipmUXSmU+BaVNGBx/iN6KeUC4BJfFYRG2S+rRTAT3IKTdzC
	4wZMD+r3B1OPHPylhD7DefyoTh6wp7/v2Vz6I2uFgsnd6gAfh44OD+5eg/kHRjhjvTku
	BZA3HX7c1xqBoeLPf8g1kzl0tNA1o+mNxrV5bH1ZtYIAfmznuIJBWEKMfUAgSxVum7DF
	dAYfarQegLA5xwr648k6d+va5/6O8CsKKZc5sAGoiOLfNPvkSK/FP4sdkPbZfaDxg4N5
	WgoniSDpYGFKR1+AOYttvN343oezVaT/mzOlfTDWnq+JIBb0RR6RMtmfQIn/3CEVL2qS
	pNpg==
X-Gm-Message-State: ABuFfogJytMs/rt1q7GEFti6BULA3R6kHkVW+EpwYS4m216vyUOqhLg0
	QzNlr8ZGL1BlY0RucNoorIZtxsUisgpVvtQB9sE=
X-Google-Smtp-Source: ACcGV61S3xH4GWIowDYrjcSEDAMjR+ysVgEqRxSOIJ8RSFym153gIt2H8rpGAwjnuAhWLKmPjbxXEL3VoDAlkuXR/vA=
X-Received: by 2002:a2e:501c:: with SMTP id
	e28-v6mr1981198ljb.45.1539283673251; 
	Thu, 11 Oct 2018 11:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <1539229819-322989-1-git-send-email-mingli.yu@windriver.com>
	<1539229819-322989-3-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1539229819-322989-3-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:47:38 -0400
Message-ID: <CADkTA4NhF6cV4wtsaN+Qh+ir4C41tkyM-XuX0RoA=P6F-w0APw@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-openstack][PATCH 3/3] postgresql: make append version independent
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2018 18:47:55 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Wed, Oct 10, 2018 at 11:50 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Make bbappend version independent and only
> effective when the openstack distro enabled.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  .../recipes-dbs/postgresql/postgresql_%.bbappend   |  1 +
>  .../recipes-dbs/postgresql/postgresql_9.%.bbappend | 60 ----------------------
>  .../postgresql/postgresql_openstack.inc            | 60 ++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 60 deletions(-)
>  create mode 100644 meta-openstack/recipes-dbs/postgresql/postgresql_%.bbappend
>  delete mode 100644 meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
>  create mode 100644 meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
>
> diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_%.bbappend b/meta-openstack/recipes-dbs/postgresql/postgresql_%.bbappend
> new file mode 100644
> index 0000000..025ee4e
> --- /dev/null
> +++ b/meta-openstack/recipes-dbs/postgresql/postgresql_%.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'openstack', '${BPN}_openstack.inc', '', d)}
> diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend b/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
> deleted file mode 100644
> index 5bf25e1..0000000
> --- a/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += " \
> -    file://postgresql-init \
> -    file://postgresql-init.service \
> -    "
> -
> -inherit identity hosts
> -
> -SYSTEMD_AUTO_ENABLE_${PN} = "enable"
> -
> -# default
> -DB_DATADIR ?= "/var/lib/postgres/data"
> -
> -do_install_append() {
> -    D_DEST_DIR=${D}${sysconfdir}/postgresql
> -
> -    install -d ${D_DEST_DIR}
> -    install -m 0755 ${WORKDIR}/postgresql-init ${D_DEST_DIR}/postgresql-init
> -
> -    sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${D_DEST_DIR}/postgresql-init
> -
> -    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${D_DEST_DIR}/postgresql-init
> -    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${D_DEST_DIR}/postgresql-init
> -
> -    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${D_DEST_DIR}/postgresql-init
> -    sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${D_DEST_DIR}/postgresql-init
> -
> -    sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${D_DEST_DIR}/postgresql-init
> -    sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${D_DEST_DIR}/postgresql-init
> -
> -    install -d ${D}${systemd_unitdir}/system/
> -    PG_INIT_SERVICE_FILE=${D}${systemd_unitdir}/system/postgresql-init.service
> -    install -m 644 ${WORKDIR}/postgresql-init.service ${PG_INIT_SERVICE_FILE}
> -    sed -e "s:%SYSCONFIGDIR%:${sysconfdir}:g" -i ${PG_INIT_SERVICE_FILE}
> -
> -    # Update PGDATA throughout
> -    files="${D}${localstatedir}/lib/${BPN}/.bash_profile"
> -    files="$files ${D}${systemd_unitdir}/system/postgresql.service"
> -    files="$files ${D}${bindir}/${BPN}-setup"
> -    files="$files ${D}${sysconfdir}/init.d/${BPN}-server"
> -    for f in $files
> -    do
> -        sed -e "s:\(PGDATA=\).*$:\1${DB_DATADIR}:g" -i $f
> -    done
> -
> -    # Ensure DB is initialize before we attempt to start the service
> -    FILE=${D}${systemd_unitdir}/system/postgresql.service
> -    sed -e '/ExecStart=.*/i ExecStartPre=-${sysconfdir}/postgresql/postgresql-init initdb' -i $FILE
> -    sed -e '/ExecStartPre=.*/i PermissionsStartOnly=true' -i $FILE
> -}
> -
> -PACKAGES += " ${PN}-setup"
> -
> -SYSTEMD_PACKAGES += "${PN}-setup"
> -SYSTEMD_SERVICE_${PN}-setup = "postgresql-init.service"
> -
> -FILES_${PN}-setup = " \
> -    ${systemd_unitdir}/system \
> -"
> diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
> new file mode 100644
> index 0000000..5bf25e1
> --- /dev/null
> +++ b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
> @@ -0,0 +1,60 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += " \
> +    file://postgresql-init \
> +    file://postgresql-init.service \
> +    "
> +
> +inherit identity hosts
> +
> +SYSTEMD_AUTO_ENABLE_${PN} = "enable"
> +
> +# default
> +DB_DATADIR ?= "/var/lib/postgres/data"
> +
> +do_install_append() {
> +    D_DEST_DIR=${D}${sysconfdir}/postgresql
> +
> +    install -d ${D_DEST_DIR}
> +    install -m 0755 ${WORKDIR}/postgresql-init ${D_DEST_DIR}/postgresql-init
> +
> +    sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${D_DEST_DIR}/postgresql-init
> +
> +    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${D_DEST_DIR}/postgresql-init
> +    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${D_DEST_DIR}/postgresql-init
> +
> +    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${D_DEST_DIR}/postgresql-init
> +    sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${D_DEST_DIR}/postgresql-init
> +
> +    sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${D_DEST_DIR}/postgresql-init
> +    sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${D_DEST_DIR}/postgresql-init
> +
> +    install -d ${D}${systemd_unitdir}/system/
> +    PG_INIT_SERVICE_FILE=${D}${systemd_unitdir}/system/postgresql-init.service
> +    install -m 644 ${WORKDIR}/postgresql-init.service ${PG_INIT_SERVICE_FILE}
> +    sed -e "s:%SYSCONFIGDIR%:${sysconfdir}:g" -i ${PG_INIT_SERVICE_FILE}
> +
> +    # Update PGDATA throughout
> +    files="${D}${localstatedir}/lib/${BPN}/.bash_profile"
> +    files="$files ${D}${systemd_unitdir}/system/postgresql.service"
> +    files="$files ${D}${bindir}/${BPN}-setup"
> +    files="$files ${D}${sysconfdir}/init.d/${BPN}-server"
> +    for f in $files
> +    do
> +        sed -e "s:\(PGDATA=\).*$:\1${DB_DATADIR}:g" -i $f
> +    done
> +
> +    # Ensure DB is initialize before we attempt to start the service
> +    FILE=${D}${systemd_unitdir}/system/postgresql.service
> +    sed -e '/ExecStart=.*/i ExecStartPre=-${sysconfdir}/postgresql/postgresql-init initdb' -i $FILE
> +    sed -e '/ExecStartPre=.*/i PermissionsStartOnly=true' -i $FILE
> +}
> +
> +PACKAGES += " ${PN}-setup"
> +
> +SYSTEMD_PACKAGES += "${PN}-setup"
> +SYSTEMD_SERVICE_${PN}-setup = "postgresql-init.service"
> +
> +FILES_${PN}-setup = " \
> +    ${systemd_unitdir}/system \
> +"
> --
> 2.7.4
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

