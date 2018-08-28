Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC530E00777; Tue, 28 Aug 2018 05:22:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFAC3E0043F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Aug 2018 05:22:20 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id g9-v6so1217173lfh.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Aug 2018 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qr/H/KqWZvQRf0ogETtch3ZNGSrZrTcvdW3EO6syb+g=;
	b=o+MCthbJVbw9kVriwBQgzSCK6XWhKpXMUJAPHOuMKIVrShYC90a1tbTdbxpVwFoxS9
	sTz7WUvn3dLcVLxtqduP4HWF3l8FSVgpF+BQqS71lOef0DFsOAIzP9PMS193GH4Ya0g+
	spT9b7fGMtw6Q/oKrqmgNmhQ4JCtsDZHVi93/sgZzHa3xKkYkfFNtNg3Evkejjy2CBMR
	DQzO6beqNz4p2HfG4/6o1NPS3xvix7vtEOEQfGBrzIt8QyxHzsxqdt65dW3AqOvOKAs2
	aQfeNYBjxIEtpmKszwaQLRDwxCt8xQAvO/fwnxcN0zPHAFy1aaOBzoM9srafxALhBuSc
	iqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qr/H/KqWZvQRf0ogETtch3ZNGSrZrTcvdW3EO6syb+g=;
	b=HDLCJMyRxZk12BWregdeK2JzNMczzyhu6pbw2gP0m0CA5tk+jnZlWmF7rvl1s8H8L/
	RLFqsaWI12WBZ7GCdA99cTPR0vD6HFy+Z9UH1XP38VY4kkKqTrLO9PfK9A9QcwgAmjLu
	tUzUF4nbDXcodUZfzfAFVMqaRme6XJJg6LGAYIElW4VJ8ZjBjoASSb2f3OWGdHnfdd1I
	frp3XrBH2rgqv9YidvjWVYIqoAClxaKfd56sJZs2BG1xiVSffvHlXulCs0Ln9+P9T9go
	t0oou59nddnnsqVhY28HQqh70rKgNsJpSF2B9mcg98VyAZU2nJPxJ8ysoDvi2Nd6SF3h
	TiUw==
X-Gm-Message-State: APzg51DnTFMHyC0sbJN6IeoyPcu9b/aSsG9xJcYcy0BKzcyDzqcXL3f5
	wLyWVcsBLjaNw6mrjiu72iZSZDQ3nGzRVtNTdJuhDw==
X-Google-Smtp-Source: ANB0VdZ860wOHJqTCncGslwc5VXKiymqxKOtaWcck4KB9f0ABKevioAVYoJS9+9MJe6bUGaw+UCushnte+qeuhT6dwo=
X-Received: by 2002:a19:6b0b:: with SMTP id
	d11-v6mr1002184lfa.99.1535458939783; 
	Tue, 28 Aug 2018 05:22:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 05:22:19
	-0700 (PDT)
In-Reply-To: <20180827121227.6950-1-adrian.ratiu@ni.com>
References: <20180827121227.6950-1-adrian.ratiu@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Aug 2018 08:22:19 -0400
Message-ID: <CADkTA4NTp0hfOv89=k4rT_Jhesb6sHaWE7mPxpLrZRoEWU_SCQ@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-openstack][PATCH 1/2] python3-avahi: add recipe
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
X-List-Received-Date: Tue, 28 Aug 2018 12:22:23 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 27, 2018 at 8:12 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../recipes-devtools/python/python-avahi.inc  | 32 ++++++++++++++++++
>  .../python/python-avahi_0.6.32.bb             | 33 ++-----------------
>  .../python/python3-avahi_0.6.32.bb            |  5 +++
>  3 files changed, 39 insertions(+), 31 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-avahi.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-avahi.inc b/meta-openstack/recipes-devtools/python/python-avahi.inc
> new file mode 100644
> index 0000000..86cafe5
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-avahi.inc
> @@ -0,0 +1,32 @@
> +SUMMARY = "Python bindings for the avahi zeroconf client"
> +HOMEPAGE = "https://github.com/lathiat/avahi"
> +SECTION = "devel/python"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
> +SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
> +
> +S = "${WORKDIR}/avahi-${PV}"
> +
> +inherit pythonnative
> +
> +# we only need the python bindings
> +do_install () {
> +       install -d ${D}${PYTHON_SITEPACKAGES_DIR}/avahi
> +
> +       sed -i'' -e "s,@PYTHON\@,${bindir}/${PYTHON_PN},g" \
> +               ${S}/avahi-python/avahi/__init__.py  \
> +               ${S}/avahi-python/avahi-bookmarks.in
> +
> +       install -m 0775 ${S}/avahi-python/avahi/__init__.py \
> +               ${D}${PYTHON_SITEPACKAGES_DIR}/avahi/__init__.py
> +
> +       install -m 0775 ${S}/avahi-python/avahi-bookmarks.in \
> +               ${D}${PYTHON_SITEPACKAGES_DIR}/avahi/avahi-bookmarks
> +}
> +
> +FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/avahi"
> diff --git a/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb b/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
> index c129337..7a54211 100644
> --- a/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
> +++ b/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
> @@ -1,34 +1,5 @@
> -SUMMARY = "Python bindings for the avahi zeroconf client"
> -HOMEPAGE = "https://github.com/lathiat/avahi"
> -SECTION = "devel/python"
> +require python-avahi.inc
>
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
> -
> -SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
> -SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
> -
> -S = "${WORKDIR}/avahi-${PV}"
> -
> -inherit python-dir pythonnative
> -
> -# we only need the python bindings
> -do_install () {
> -       install -d ${D}${PYTHON_SITEPACKAGES_DIR}/avahi
> -
> -       sed -i'' -e "s,@PYTHON\@,${bindir}/python,g" \
> -               ${S}/avahi-python/avahi/__init__.py  \
> -               ${S}/avahi-python/avahi-bookmarks.in
> -
> -       install -m 0775 ${S}/avahi-python/avahi/__init__.py \
> -               ${D}${PYTHON_SITEPACKAGES_DIR}/avahi/__init__.py
> -
> -       install -m 0775 ${S}/avahi-python/avahi-bookmarks.in \
> -               ${D}${PYTHON_SITEPACKAGES_DIR}/avahi/avahi-bookmarks
> -}
> +inherit python-dir
>
>  RDEPENDS_${PN} += "python-core python-dbus"
> -
> -FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/avahi"
> diff --git a/meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb b/meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb
> new file mode 100644
> index 0000000..4b85cd5
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb
> @@ -0,0 +1,5 @@
> +require python-avahi.inc
> +
> +inherit python3-dir
> +
> +RDEPENDS_${PN} += "python3-core python3-dbus"
> --
> 2.18.0
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

