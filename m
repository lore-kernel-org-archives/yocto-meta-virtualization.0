Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66807E007A5; Tue, 29 Sep 2015 08:04:52 -0700 (PDT)
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
	*      [209.85.160.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5B0DE00CB6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Sep 2015 08:04:43 -0700 (PDT)
Received: by ykdg206 with SMTP id g206so9540009ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Sep 2015 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CNXbZxBYErsFPxZP4V1b999qxMEBu2KGPf+bZcB/sFM=;
	b=VqTi+bpzXsNLBVaPOBzxuyctP73/xqwDc6gVPgnq7ns6NFa5prFeDa2aHY0zeJuwcY
	esyMZ+1edQ+/NT8mkrSIubEwd7sA2qu0N4IA6HnEYKx7VIHtNzv0xfyb6BnMXxNd45YT
	MN1+S+jbnFVtumtKZHUSR4tgaToH1BHXpo3kCf6wYNYXIpi3XhTakjsVw0Wofz4CN1Sd
	ZcQMtuXP8GkRvyoNfIz5kyhdVS88xLrQETOSUBhjcFPMtbvNNosGPLzsSo6A8HFMWuq8
	ikWzHq/dEWKBOiuW6M3ZmzLoUiXqzn/IMYWWPUYl7062QGHODmRLRXRDGZnU9ZZXUj2w
	yRCg==
MIME-Version: 1.0
X-Received: by 10.170.196.201 with SMTP id n192mr20639129yke.16.1443539082900; 
	Tue, 29 Sep 2015 08:04:42 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Tue, 29 Sep 2015 08:04:42 -0700 (PDT)
In-Reply-To: <1443515876-3573-1-git-send-email-arnold.csorvasi@ni.com>
References: <1443515876-3573-1-git-send-email-arnold.csorvasi@ni.com>
Date: Tue, 29 Sep 2015 11:04:42 -0400
Message-ID: <CADkTA4Og=WvRLeOraeRV8GUijtgtZvnyM2Lki-Eccfm1hKVSCA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Arnold Csorvasi <arnold.csorvasi@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH] qpid: inherit pkgconfig class
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
X-List-Received-Date: Tue, 29 Sep 2015 15:04:52 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 29, 2015 at 4:37 AM, Arnold Csorvasi <arnold.csorvasi@ni.com> wrote:
> Also add -Wno-unused-function to prevent build from failing.
>

merged.

Bruce

> Signed-off-by: Arnold Csorvasi <arnold.csorvasi@ni.com>
> ---
>  meta-openstack/recipes-extended/qpid/qpid_0.20.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
> index a6f1c67..5e6ae2d 100644
> --- a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
> +++ b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
> @@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "31b80ba3c4773d288b4e6245e3b2048438386331d460f7a7b0794cbd20
>
>  S = "${WORKDIR}/${PN}c-${PV}"
>
> -inherit autotools python-dir perlnative cpan-base update-rc.d
> +inherit autotools python-dir perlnative cpan-base update-rc.d pkgconfig
>
>  # Env var which tells perl if it should use host (no) or target (yes) settings
>  export PERLCONFIGTARGET = "${@is_target(d)}"
> @@ -27,6 +27,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
>  export PERL="${STAGING_BINDIR}/perl"
>
>  EXTRA_OECONF += " --without-help2man SASL_PASSWD=/usr/sbin/saslpasswd2"
> +EXTRA_OEMAKE += " CPPFLAGS=-Wno-unused-function "
>
>  do_install_append() {
>       install -d ${D}${sysconfdir}/init.d
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

