Return-Path: <adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27B1CE0034A; Tue,  3 Jan 2017 08:49:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [130.164.80.24 listed in list.dnswl.org]
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6ACBE0030B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Jan 2017 08:49:43 -0800 (PST)
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	v03Gng1B020164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 3 Jan 2017 10:49:42 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 3 Jan 2017 10:49:41 -0600
Received: from adi-pc-linux (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 3 Jan 2017 10:49:41 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
In-Reply-To: <20170103162108.13448-1-adrian.ratiu@ni.com>
References: <20170103162108.13448-1-adrian.ratiu@ni.com>
Date: Tue, 3 Jan 2017 18:47:36 +0200
Message-ID: <87y3ys145z.fsf@adi-pc-linux.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-01-03_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=24
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1701030260
Subject: Re: [PATCH] meta-openstack: add new python-avahi	recipe
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
X-List-Received-Date: Tue, 03 Jan 2017 16:49:47 -0000
Content-Type: text/plain

On Tue, 03 Jan 2017, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> OE-core commit 36e9ed89950 ("avahi-ui: remove support for building a python
> module") removed the python avahi bindings because nothing in OE-core used
> them. These bindings are very useful however when configuring targets from
> salt using the zeroconf protocol.
>
> An added benefit of having a python-avahi recipe separate from avahi-ui is
> that we don't need X11 in DISTRO_FEATURES anymore to use python-avahi, it's
> just two simple python files, there was no need for all that complexity in
> avahi-ui in the first place to get the python avahi bindings.
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../recipes-devtools/python/python-avahi_0.6.32.bb | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb b/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
> new file mode 100644
> index 0000000..e79756d
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
> @@ -0,0 +1,35 @@
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
> +inherit python-dir pythonnative
> +
> +# we only need the python bindings
> +do_install () {
> +	install -d ${D}${PYTHON_SITEPACKAGES_DIR}/avahi
> +
> +	sed -i'' -e 's,@PYTHON\@,/usr/bin/python,g'  \
> +		${S}/avahi-python/avahi/__init__.py  \
> +		${S}/avahi-python/avahi-bookmarks.in
> +
> +	install -m 0775 ${S}/avahi-python/avahi/__init__.py \
> +		${D}${PYTHON_SITEPACKAGES_DIR}/avahi/__init__.py
> +
> +	install -m 0775 ${S}/avahi-python/avahi-bookmarks.in \
> +		${D}${PYTHON_SITEPACKAGES_DIR}/avahi/avahi-bookmarks
> +}
> +
> +RDEPENDS_${PN} += "python-core python-dbus"
> +
> +FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/avahi"
> +q

Sorry for this stupid typo. I've sent v2.

> -- 
> 2.11.0
>
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

