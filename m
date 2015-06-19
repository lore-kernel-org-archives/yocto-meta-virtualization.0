Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2149DE009D6; Fri, 19 Jun 2015 12:26:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74EB6E00992
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Jun 2015 12:26:13 -0700 (PDT)
Received: by ykdr198 with SMTP id r198so99316843ykd.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Jun 2015 12:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6sUTbFD0J/i9v4stJZtyHu6bJQFSm7AzlQ7iYPxWni4=;
	b=ZF4PbOzm215th2crMtIjvNp6p1AUzu55w+s8DINAC2mbiI6RT29qG0qIVDu+fBQunL
	W/xYcHNIRZ+ohd5jgaIefgWxU5vefmAuJ282L7UcruQLMFzUocvQaW9WtQKvRc/b6uSn
	yGzSP2s7M54+/ITt+4dxuq/8qPyo9k1/udncmEsZJWvsWZKwuVQ+iopqIo5cKTvnezoI
	mit1a9GD1gakBnBG2tbrBqowJP0pJ7MT6wWJcxcw8R+i8BtdlAY8GtAWUoEpPpfjvZut
	bJ3cHO+O/e/Ng8zUBjYknpM+uB8/S/mRV3LByOw7gJb2dRmqx4OWqnMYkHf4CsWlNhQz
	JqrA==
MIME-Version: 1.0
X-Received: by 10.170.80.5 with SMTP id w5mr21708913ykw.60.1434741972443; Fri,
	19 Jun 2015 12:26:12 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Fri, 19 Jun 2015 12:26:12 -0700 (PDT)
In-Reply-To: <1434690241-57136-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434690241-57136-1-git-send-email-biannm@cn.fujitsu.com>
Date: Fri, 19 Jun 2015 15:26:12 -0400
Message-ID: <CADkTA4PO-1xnoQMXSV32CTeZjYtTZUMpMYxgi7_wginuT8aMiA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] dhcp: fix build error
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
X-List-Received-Date: Fri, 19 Jun 2015 19:26:15 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 19, 2015 at 1:04 AM, Bian Naimeng <biannm@cn.fujitsu.com> wrote:
> dhcp in oe-core has been upgrade to 4.3.2, so the following error will be caught.
>
>  ERROR: No recipes available for:
>    /yocto/meta-cloud-services/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend


merged to branches master and fido-kilo.

Bruce

>
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  recipes-connectivity/dhcp/dhcp_%.bbappend     | 16 ++++++++++++++++
>  recipes-connectivity/dhcp/dhcp_4.3.1.bbappend | 16 ----------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
>  create mode 100644 recipes-connectivity/dhcp/dhcp_%.bbappend
>  delete mode 100644 recipes-connectivity/dhcp/dhcp_4.3.1.bbappend
>
> diff --git a/recipes-connectivity/dhcp/dhcp_%.bbappend b/recipes-connectivity/dhcp/dhcp_%.bbappend
> new file mode 100644
> index 0000000..a23f7c9
> --- /dev/null
> +++ b/recipes-connectivity/dhcp/dhcp_%.bbappend
> @@ -0,0 +1,16 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +
> +SRC_URI += "file://dhclient-exit-hooks \
> +           "
> +
> +do_install_append () {
> +       install -m 0644 ${WORKDIR}/dhclient-exit-hooks ${D}${sysconfdir}/dhcp/dhclient-exit-hooks
> +       sed 's%/etc/dhclient-exit-hooks%/etc/dhcp/dhclient-exit-hooks%g' -i ${D}${base_sbindir}/dhclient-script
> +
> +       sed 's%request .*%\noption classless-static-routes code 121 = array of unsigned integer 8;\n\n&%g' -i ${D}${sysconfdir}/dhcp/dhclient.conf
> +       sed 's%netbios-name-servers,.*netbios-scope;%netbios-name-servers, netbios-scope, classless-static-routes;\n%g' -i ${D}${sysconfdir}/dhcp/dhclient.conf
> +
> +}
> +
> +FILES_dhcp-client += "${sysconfdir}/dhcp/dhclient-exit-hooks \
> +                     "
> diff --git a/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend b/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend
> deleted file mode 100644
> index a23f7c9..0000000
> --- a/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> -
> -SRC_URI += "file://dhclient-exit-hooks \
> -           "
> -
> -do_install_append () {
> -       install -m 0644 ${WORKDIR}/dhclient-exit-hooks ${D}${sysconfdir}/dhcp/dhclient-exit-hooks
> -       sed 's%/etc/dhclient-exit-hooks%/etc/dhcp/dhclient-exit-hooks%g' -i ${D}${base_sbindir}/dhclient-script
> -
> -       sed 's%request .*%\noption classless-static-routes code 121 = array of unsigned integer 8;\n\n&%g' -i ${D}${sysconfdir}/dhcp/dhclient.conf
> -       sed 's%netbios-name-servers,.*netbios-scope;%netbios-name-servers, netbios-scope, classless-static-routes;\n%g' -i ${D}${sysconfdir}/dhcp/dhclient.conf
> -
> -}
> -
> -FILES_dhcp-client += "${sysconfdir}/dhcp/dhclient-exit-hooks \
> -                     "
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

