Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5BBFE009BF; Tue, 15 Nov 2016 06:44:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_10_20, 
	RCVD_IN_DNSWL_LOW,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.175 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.175 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.1 HTML_OBFUSCATE_10_20 BODY: Message is 10% to 20% HTML obfuscation
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DA67E009A5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Nov 2016 06:44:37 -0800 (PST)
Received: by mail-qk0-f175.google.com with SMTP id n204so137345773qke.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Nov 2016 06:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HA9wG25Bns9gQwjVNLo++b6N7KPSIiRtZicQ3gS/pzQ=;
	b=noGwbNGaiQvx8ecJS5Z3oWDNhpxY/P4iD+YTX0yiISDXzHNKQ/EJSK7JVga1bMLlAN
	kiB7SuEbf8t9dKQ5po3Qsnkutqlqdo46UfFZZTxdF/4Z47t0SBp6fbAbghl2iN6y3C9x
	Bf8XWcVSiiYnFPk1QxDJFkW2sONyHI4CVOOcMTwG6DazFKeSOSwJWZR56eDHgungFOUa
	a4PGVuEK+arhXleBpFCc6XnQRTjasIEc7C7B6dGS4cW15SqJCkFwtyFTA0uXsN61kvG5
	VHu9nlb56pgxtLQSRx3DDJlUi8OUlB+NWfKPr8O6JjLKiPw7JAwqtJ2S8898GH7Csqk7
	fEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HA9wG25Bns9gQwjVNLo++b6N7KPSIiRtZicQ3gS/pzQ=;
	b=BWjjelpQUB6VNSdVEw2fw4HuGKbT7o8F6tWY0fARakI/S/q8McM0JTMZO2X/Yx0gnA
	OIpITSq6NjsBIYcOYV72uejJBGpHA4LNq5w3O4DLvCLmIA1p/5QWo++RVEQBSiIPPXTK
	r7Byt9sJt77RMzoSsG0hs2ajRKAaVLJL5RI55l+cY0sG/UzUnKjTTib75aaqZ8VwTqEY
	QjewP377ZkgYKX4HwUQrar7E899zzMFqre4YbeVSqhaU3ZHSbNL4YSj8qKxbjZcWOtqI
	JYitiWleGwdaYbxi7CxQYMJ0nObleKl2MCSztTOQuVSuNeY2jWZVXX2B7p677n3GdXsE
	njkw==
X-Gm-Message-State: ABUngvcjDWply7uhfwVwQZmE0PjLQ/us8UdgxiHXEnF1zwRJv7UpuYz8rOzguvTU9cDe5tMoUeMHcE69G25cpw==
X-Received: by 10.55.15.152 with SMTP id 24mr23734056qkp.45.1479221076067;
	Tue, 15 Nov 2016 06:44:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Tue, 15 Nov 2016 06:44:35 -0800 (PST)
In-Reply-To: <0EC9FE42-8E5C-4895-896F-F3D77CDC9374@supercoders.com.au>
References: <689434D1-C433-4938-9F84-8F24C30093F6@supercoders.com.au>
	<CADkTA4PE=-S4AV59jE8Ui0Djnz-wgpWphE+GkXe3RwCZO+qGwQ@mail.gmail.com>
	<08A8F9CF-BDC9-4CCB-ABD1-12CABA0C4FD9@supercoders.com.au>
	<0EC9FE42-8E5C-4895-896F-F3D77CDC9374@supercoders.com.au>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 15 Nov 2016 09:44:35 -0500
Message-ID: <CADkTA4N9dWY_EcxGVOmWw79zmYUF9q-iW2GWPhUmBhfFYXXWsg@mail.gmail.com>
To: Andrew Stuart <andrew.stuart@supercoders.com.au>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: How do I enable all Xen device drivers?
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
X-List-Received-Date: Tue, 15 Nov 2016 14:44:42 -0000
Content-Type: multipart/alternative; boundary=001a114750b0c8a91d054157fefb

--001a114750b0c8a91d054157fefb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2016 at 5:52 AM, Andrew Stuart <andrew.stuart@supercoders.
com.au> wrote:

> Hi Bruce - sorry to prod, any guesses as to why the errors below?
>

The glibc-locale ones ?

Unfortunately not. I have had some locale issues in the past, but not what
you
are seeing there.

Whatever is triggering it, isn't specific to meta-virt or Xen, so you might
try asking
the question in a broader forum, like the oe-core mailing list. Someone
there who's
more familiar with the locale generation should be able to point you in the
right
direction.

Bruce


>
> thanks
>
> Andrew
>
>
> >> What branch are you building (of poky/oe-core and of meta-virt) ? It
> really shouldn=E2=80=99t matter, but it can be relevant .. so best to ask=
 right
> away.
>
> I=E2=80=99m not sure the answer to that.  How would I know which branch I=
=E2=80=99m
> building?
>
> >> Also have you put 'xen' in your DISTRO_FEATURES ? (it can be done in
> your local.conf). Those kernel configs are only added/enabled when xen is
> found in the distro config.
>
> When I do:
> bitbake xen-guest-image-minimal
>
> It builds fine.
>
> I then add DISTRO_FEATURES=3D=E2=80=9Cxen=E2=80=9D to the end of my conf/=
local.conf and do
> exactly the same thing (bitbake xen-guest-image-minimal)
>
> Which results in the following errors.  Any guesses?
>
> thanks!
>
>
> ubuntu@ugbuildserver:/mnt/dude/yocto/poky/build$ bitbake
> xen-guest-image-minimal
> Parsing recipes: 100% |#############################
> ############################################################
> ###################################################| Time: 0:01:08
> Parsing of 1903 .bb files complete (0 cached, 1903 parsed). 2597 targets,
> 351 skipped, 0 masked, 0 errors.
> NOTE: There are 3 recipes to be removed from sysroot x86_64, removing...
> NOTE: There are 1 recipes to be removed from sysroot allarch, removing...
> NOTE: There are 24 recipes to be removed from sysroot core2-64, removing.=
..
> NOTE: There are 25 recipes to be removed from sysroot qemux86-64,
> removing...
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        =3D "1.32.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "universal"
> TARGET_SYS        =3D "x86_64-poky-linux"
> MACHINE           =3D "qemux86-64"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "2.2"
> TUNE_FEATURES     =3D "m64 core2"
> TARGET_FPU        =3D ""
> meta
> meta-poky
> meta-yocto-bsp
> meta-webserver    =3D "morty:dc8508f609974cc99606b9042bfa7f870ce80228"
> meta-virtualization =3D "master:011c4d611b3ce4e4922207ea0f58fd475eab83fb"
> meta-networking
> meta-oe
> meta-python
> meta-filesystems  =3D "morty:dc8508f609974cc99606b9042bfa7f870ce80228"
>
> Initialising tasks: 100% |#############################
> ############################################################
> ################################################| Time: 0:00:04
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: glibc-locale-2.24-r0 do_package: QA Issue: glibc-locale:
> Files/directories were installed but not shipped in any package:
>  /usr/share/i18n
>  /usr/share/i18n/locales
>  /usr/share/i18n/charmaps
>  /usr/share/i18n/locales/kw_GB
>  /usr/share/i18n/locales/ug_CN
>  /usr/share/i18n/locales/as_IN
>  /usr/share/i18n/locales/sa_IN
>  /usr/share/i18n/locales/mhr_RU
>  /usr/share/i18n/locales/ml_IN
>  /usr/share/i18n/locales/ak_GH
>  /usr/share/i18n/locales/tg_TJ
>  /usr/share/i18n/locales/translit_compat
>  /usr/share/i18n/locales/fr_FR
>  /usr/share/i18n/locales/sl_SI
>  /usr/share/i18n/locales/xh_ZA
>  /usr/share/i18n/locales/lv_LV
>  /usr/share/i18n/locales/de_DE
>  /usr/share/i18n/locales/bn_BD
>  /usr/share/i18n/locales/so_DJ
>  /usr/share/i18n/locales/ku_TR
>  /usr/share/i18n/locales/es_AR
>  /usr/share/i18n/locales/yi_US
>  /usr/share/i18n/locales/pt_PT
>  /usr/share/i18n/locales/it_IT@euro
>  /usr/share/i18n/locales/st_ZA
>  /usr/share/i18n/locales/translit_cjk_variants
>  /usr/share/i18n/locales/en_HK
>  /usr/share/i18n/locales/ga_IE@euro
>  /usr/share/i18n/locales/ur_PK
>  /usr/share/i18n/locales/tr_TR
>  /usr/share/i18n/locales/aa_ER
>  /usr/share/i18n/locales/nl_AW
>  /usr/share/i18n/locales/tt_RU@iqtelif
>  /usr/share/i18n/locales/es_CL
>  /usr/share/i18n/locales/en_IE@euro
>  /usr/share/i18n/locales/csb_PL
>  /usr/share/i18n/locales/de_BE
>  /usr/share/i18n/locales/br_FR
>  /usr/share/i18n/locales/es_GT
>  /usr/share/i18n/locales/lg_UG
>  /usr/share/i18n/locales/os_RU
>  /usr/share/i18n/locales/uz_UZ
>  /usr/share/i18n/locales/de_BE@euro
>  /usr/share/i18n/locales/mk_MK
>  /usr/share/i18n/locales/nl_NL@euro
>  /usr/share/i18n/locales/i18n
>  /usr/share/i18n/locales/ka_GE
>  /usr/share/i18n/locales/shs_CA
>  /usr/share/i18n/locales/gu_IN
>  /usr/share/i18n/locales/cs_CZ
>  /usr/share/i18n/locales/pap_AW
>  /usr/share/i18n/locales/ar_AE
>  /usr/share/i18n/locales/gez_ET
>  /usr/share/i18n/locales/ha_NG
>  /usr/share/i18n/locales/nso_ZA
>  /usr/share/i18n/locales/en_DK
>  /usr/share/i18n/locales/sq_MK
>  /usr/share/i18n/locales/en_CA
>  /usr/share/i18n/locales/sr_ME
>  /usr/share/i18n/locales/sgs_LT
>  /usr/share/i18n/locales/fr_BE@euro
>  /usr/share/i18n/locales/es_MX
>  /usr/share/i18n/locales/en_NZ
>  /usr/share/i18n/locales/ga_IE
>  /usr/share/i18n/locales/ar_IN
>  /usr/share/i18n/locales/pap_CW
>  /usr/share/i18n/locales/ru_RU
>  /usr/share/i18n/locales/es_US
>  /usr/share/i18n/locales/es_PY
>  /usr/share/i18n/locales/nl_NL
>  /usr/share/i18n/locales/es_ES
>  /usr/share/i18n/locales/en_IN
>  /usr/share/i18n/locales/pl_PL
>  /usr/share/i18n/locales/sq_AL
>  /usr/share/i18n/locales/ca_ES
>  /usr/share/i18n/locales/zh_CN
>  /usr/share/i18n/locales/ks_IN@devanagari
>  /usr/share/i18n/locales/gez_ER@abegede
>  /usr/share/i18n/locales/de_LI
>  /usr/share/i18n/locales/fil_PH
>  /usr/share/i18n/locales/pa_IN
>  /usr/share/i18n/locales/ig_NG
>  /usr/share/i18n/locales/brx_IN
>  /usr/share/i18n/locales/is_IS
>  /usr/share/i18n/locales/en_AU
>  /usr/share/i18n/locales/gez_ER
>  /usr/share/i18n/locales/bem_ZM
>  /usr/share/i18n/locales/sr_RS@latin
>  /usr/share/i18n/locales/mr_IN
>  /usr/share/i18n/locales/ca_AD
>  /usr/share/i18n/locales/ro_RO
>  /usr/share/i18n/locales/kk_KZ
>  /usr/share/i18n/locales/te_IN
>  /usr/share/i18n/locales/en_ZW
>  /usr/share/i18n/locales/dv_MV
>  /usr/share/i18n/locales/az_AZ
>  /usr/share/i18n/locales/aa_ET
>  /usr/share/i18n/locales/es_CU
>  /usr/share/i18n/locales/id_ID
>  /usr/share/i18n/locales/wal_ET
>  /usr/share/i18n/locales/bho_IN
>  /usr/share/i18n/locales/es_BO
>  /usr/share/i18n/locales/hak_TW
>  /usr/share/i18n/locales/ru_UA
>  /usr/share/i18n/locales/zu_ZA
>  /usr/share/i18n/locales/uz_UZ@cyrillic
>  /usr/share/i18n/locales/be_BY@latin
>  /usr/share/i18n/locales/be_BY
>  /usr/share/i18n/locales/ca_FR
>  /usr/share/i18n/locales/it_CH
>  /usr/share/i18n/locales/sd_IN@devanagari
>  /usr/share/i18n/locales/sid_ET
>  /usr/share/i18n/locales/de_AT@euro
>  /usr/share/i18n/locales/tt_RU
>  /usr/share/i18n/locales/hi_IN
>  /usr/share/i18n/locales/ar_YE
>  /usr/share/i18n/locales/POSIX
>  /usr/share/i18n/locales/ne_NP
>  /usr/share/i18n/locales/sc_IT
>  /usr/share/i18n/locales/am_ET
>  /usr/share/i18n/locales/fi_FI
>  /usr/share/i18n/locales/fr_LU@euro
>  /usr/share/i18n/locales/km_KH
>  /usr/share/i18n/locales/niu_NU
>  /usr/share/i18n/locales/chr_US
>  /usr/share/i18n/locales/tr_CY
>  /usr/share/i18n/locales/nl_BE@euro
>  /usr/share/i18n/locales/ar_SD
>  /usr/share/i18n/locales/ber_MA
>  /usr/share/i18n/locales/yo_NG
>  /usr/share/i18n/locales/en_IE
>  /usr/share/i18n/locales/translit_narrow
>  /usr/share/i18n/locales/ss_ZA
>  /usr/share/i18n/locales/cmn_TW
>  /usr/share/i18n/locales/translit_wide
>  /usr/share/i18n/locales/om_ET
>  /usr/share/i18n/locales/af_ZA
>  /usr/share/i18n/locales/byn_ER
>  /usr/share/i18n/locales/ik_CA
>  /usr/share/i18n/locales/fy_DE
>  /usr/share/i18n/locales/tk_TM
>  /usr/share/i18n/locales/kn_IN
>  /usr/share/i18n/locales/niu_NZ
>  /usr/share/i18n/locales/gl_ES
>  /usr/share/i18n/locales/or_IN
>  /usr/share/i18n/locales/eo
>  /usr/share/i18n/locales/tcy_IN
>  /usr/share/i18n/locales/ar_SS
>  /usr/share/i18n/locales/ca_IT
>  /usr/share/i18n/locales/nan_TW@latin
>  /usr/share/i18n/locales/es_PA
>  /usr/share/i18n/locales/ti_ET
>  /usr/share/i18n/locales/oc_FR
>  /usr/share/i18n/locales/wa_BE@euro
>  /usr/share/i18n/locales/th_TH
>  /usr/share/i18n/locales/en_GB
>  /usr/share/i18n/locales/ayc_PE
>  /usr/share/i18n/locales/translit_cjk_compat
>  /usr/share/i18n/locales/br_FR@euro
>  /usr/share/i18n/locales/mg_MG
>  /usr/share/i18n/locales/cy_GB
>  /usr/share/i18n/locales/fo_FO
>  /usr/share/i18n/locales/ar_TN
>  /usr/share/i18n/locales/translit_circle
>  /usr/share/i18n/locales/szl_PL
>  /usr/share/i18n/locales/fr_LU
>  /usr/share/i18n/locales/ar_LB
>  /usr/share/i18n/locales/sv_FI@euro
>  /usr/share/i18n/locales/mn_MN
>  /usr/share/i18n/locales/fur_IT
>  /usr/share/i18n/locales/zh_HK
>  /usr/share/i18n/locales/ks_IN
>  /usr/share/i18n/locales/ar_DZ
>  /usr/share/i18n/locales/so_ET
>  /usr/share/i18n/locales/ja_JP
>  /usr/share/i18n/locales/ta_LK
>  /usr/share/i18n/locales/el_GR
>  /usr/share/i18n/locales/sat_IN
>  /usr/share/i18n/locales/uk_UA
>  /usr/share/i18n/locales/es_UY
>  /usr/share/i18n/locales/kl_GL
>  /usr/share/i18n/locales/sv_FI
>  /usr/share/i18n/locales/translit_small
>  /usr/share/i18n/locales/ky_KG
>  /usr/share/i18n/locales/doi_IN
>  /usr/share/i18n/locales/hy_AM
>  /usr/share/i18n/locales/se_NO
>  /usr/share/i18n/locales/quz_PE
>  /usr/share/i18n/locales/wae_CH
>  /usr/share/i18n/locales/raj_IN
>  /usr/share/i18n/locales/sv_SE
>  /usr/share/i18n/locales/el_GR@euro
>  /usr/share/i18n/locales/tig_ER
>  /usr/share/i18n/locales/en_PH
>  /usr/share/i18n/locales/fr_BE
>  /usr/share/i18n/locales/de_CH
>  /usr/share/i18n/locales/tn_ZA
>  /usr/share/i18n/locales/en_US
>  /usr/share/i18n/locales/iso14651_t1_pinyin
>  /usr/share/i18n/locales/es_VE
>  /usr/share/i18n/locales/de_LU
>  /usr/share/i18n/locales/ln_CD
>  /usr/share/i18n/locales/translit_font
>  /usr/share/i18n/locales/ts_ZA
>  /usr/share/i18n/locales/fy_NL
>  /usr/share/i18n/locales/ce_RU
>  /usr/share/i18n/locales/an_ES
>  /usr/share/i18n/locales/es_NI
>  /usr/share/i18n/locales/ar_SY
>  /usr/share/i18n/locales/es_PR
>  /usr/share/i18n/locales/nhn_MX
>  /usr/share/i18n/locales/gez_ET@abegede
>  /usr/share/i18n/locales/hr_HR
>  /usr/share/i18n/locales/ia_FR
>  /usr/share/i18n/locales/bg_BG
>  /usr/share/i18n/locales/sw_KE
>  /usr/share/i18n/locales/ko_KR
>  /usr/share/i18n/locales/mni_IN
>  /usr/share/i18n/locales/anp_IN
>  /usr/share/i18n/locales/hne_IN
>  /usr/share/i18n/locales/bs_BA
>  /usr/share/i18n/locales/li_BE
>  /usr/share/i18n/locales/ar_LY
>  /usr/share/i18n/locales/mag_IN
>  /usr/share/i18n/locales/en_ZM
>  /usr/share/i18n/locales/eu_ES@euro
>  /usr/share/i18n/locales/da_DK
>  /usr/share/i18n/locales/ar_IQ
>  /usr/share/i18n/locales/de_LU@euro
>  /usr/share/i18n/locales/ti_ER
>  /usr/share/i18n/locales/iso14651_t1
>  /usr/share/i18n/locales/ca_ES@euro
>  /usr/share/i18n/locales/de_DE@euro
>  /usr/share/i18n/locales/fr_CA
>  /usr/share/i18n/locales/zh_TW
>  /usr/share/i18n/locales/fr_FR@euro
>  /usr/share/i18n/locales/si_LK
>  /usr/share/i18n/locales/bo_IN
>  /usr/share/i18n/locales/el_CY
>  /usr/share/i18n/locales/crh_UA
>  /usr/share/i18n/locales/nds_DE
>  /usr/share/i18n/locales/sk_SK
>  /usr/share/i18n/locales/yue_HK
>  /usr/share/i18n/locales/cv_RU
>  /usr/share/i18n/locales/my_MM
>  /usr/share/i18n/locales/sr_RS
>  /usr/share/i18n/locales/hsb_DE
>  /usr/share/i18n/locales/lb_LU
>  /usr/share/i18n/locales/en_SG
>  /usr/share/i18n/locales/ber_DZ
>  /usr/share/i18n/locales/iso14651_t1_common
>  /usr/share/i18n/locales/ar_KW
>  /usr/share/i18n/locales/dz_BT
>  /usr/share/i18n/locales/en_AG
>  /usr/share/i18n/locales/so_SO
>  /usr/share/i18n/locales/fr_CH
>  /usr/share/i18n/locales/eu_ES
>  /usr/share/i18n/locales/aa_DJ
>  /usr/share/i18n/locales/bn_IN
>  /usr/share/i18n/locales/es_EC
>  /usr/share/i18n/locales/lo_LA
>  /usr/share/i18n/locales/mi_NZ
>  /usr/share/i18n/locales/lij_IT
>  /usr/share/i18n/locales/pt_BR
>  /usr/share/i18n/locales/om_KE
>  /usr/share/i18n/locales/mt_MT
>  /usr/share/i18n/locales/wa_BE
>  /usr/share/i18n/locales/vi_VN
>  /usr/share/i18n/locales/ve_ZA
>  /usr/share/i18n/locales/de_IT
>  /usr/share/i18n/locales/en_BW
>  /usr/share/i18n/locales/translit_combining
>  /usr/share/i18n/locales/es_CR
>  /usr/share/i18n/locales/sd_IN
>  /usr/share/i18n/locales/en_ZA
>  /usr/share/i18n/locales/de_AT
>  /usr/share/i18n/locales/aa_ER@saaho
>  /usr/share/i18n/locales/es_PE
>  /usr/share/i18n/locales/lzh_TW
>  /usr/share/i18n/locales/ta_IN
>  /usr/share/i18n/locales/es_CO
>  /usr/share/i18n/locales/nl_BE
>  /usr/share/i18n/locales/nn_NO
>  /usr/share/i18n/locales/ar_OM
>  /usr/share/i18n/locales/ar_EG
>  /usr/share/i18n/locales/ar_SA
>  /usr/share/i18n/locales/ff_SN
>  /usr/share/i18n/locales/ar_BH
>  /usr/share/i18n/locales/es_DO
>  /usr/share/i18n/locales/wo_SN
>  /usr/share/i18n/locales/pt_PT@euro
>  /usr/share/i18n/locales/the_NP
>  /usr/share/i18n/locales/hu_HU
>  /usr/share/i18n/locales/nr_ZA
>  /usr/share/i18n/locales/kok_IN
>  /usr/share/i18n/locales/en_IL
>  /usr/share/i18n/locales/translit_neutral
>  /usr/share/i18n/locales/fi_FI@euro
>  /usr/share/i18n/locales/pa_PK
>  /usr/share/i18n/locales/ur_IN
>  /usr/share/i18n/locales/et_EE
>  /usr/share/i18n/locales/ps_AF
>  /usr/share/i18n/locales/fa_IR
>  /usr/share/i18n/locales/rw_RW
>  /usr/share/i18n/locales/it_IT
>  /usr/share/i18n/locales/he_IL
>  /usr/share/i18n/locales/gl_ES@euro
>  /usr/share/i18n/locales/ht_HT
>  /usr/share/i18n/locales/ar_QA
>  /usr/share/i18n/locales/ar_MA
>  /usr/share/i18n/locales/nb_NO
>  /usr/share/i18n/locales/es_ES@euro
>  /usr/share/i18n/locales/en_NG
>  /usr/share/i18n/locales/li_NL
>  /usr/share/i18n/locales/tl_PH
>  /usr/share/i18n/locales/nds_NL
>  /usr/share/i18n/locales/bhb_IN
>  /usr/share/i18n/locales/mai_IN
>  /usr/share/i18n/locales/gd_GB
>  /usr/share/i18n/locales/zh_SG
>  /usr/share/i18n/locales/unm_US
>  /usr/share/i18n/locales/ar_JO
>  /usr/share/i18n/locales/gv_GB
>  /usr/share/i18n/locales/ast_ES
>  /usr/share/i18n/locales/so_KE
>  /usr/share/i18n/locales/nan_TW
>  /usr/share/i18n/locales/ms_MY
>  /usr/share/i18n/locales/iu_CA
>  /usr/share/i18n/locales/lt_LT
>  /usr/share/i18n/locales/sw_TZ
>  /usr/share/i18n/locales/es_SV
>  /usr/share/i18n/locales/translit_hangul
>  /usr/share/i18n/locales/es_HN
>  /usr/share/i18n/locales/bo_CN
>  /usr/share/i18n/locales/translit_fraction
>  /usr/share/i18n/charmaps/IBM1160.gz
>  /usr/share/i18n/charmaps/ISO_5427-EXT.gz
>  /usr/share/i18n/charmaps/SHIFT_JISX0213.gz
>  /usr/share/i18n/charmaps/CSA_Z243.4-1985-GR.gz
>  /usr/share/i18n/charmaps/ISO_646.IRV.gz
>  /usr/share/i18n/charmaps/IBM297.gz
>  /usr/share/i18n/charmaps/VISCII.gz
>  /usr/share/i18n/charmaps/CP1257.gz
>  /usr/share/i18n/charmaps/ISO_6937-2-25.gz
>  /usr/share/i18n/charmaps/DEC-MCS.gz
>  /usr/share/i18n/charmaps/CP737.gz
>  /usr/share/i18n/charmaps/IBM871.gz
>  /usr/share/i18n/charmaps/EBCDIC-US.gz
>  /usr/share/i18n/charmaps/MAC-IS.gz
>  /usr/share/i18n/charmaps/IBM278.gz
>  /usr/share/i18n/charmaps/MAC-SAMI.gz
>  /usr/share/i18n/charmaps/ISO-8859-8.gz
>  /usr/share/i18n/charmaps/CP10007.gz
>  /usr/share/i18n/charmaps/EBCDIC-FI-SE-A.gz
>  /usr/share/i18n/charmaps/IBM862.gz
>  /usr/share/i18n/charmaps/HP-THAI8.gz
>  /usr/share/i18n/charmaps/IBM1129.gz
>  /usr/share/i18n/charmaps/ISO-IR-209.gz
>  /usr/share/i18n/charmaps/IBM865.gz
>  /usr/share/i18n/charmaps/IBM918.gz
>  /usr/share/i18n/charmaps/GBK.gz
>  /usr/share/i18n/charmaps/IBM905.gz
>  /usr/share/i18n/charmaps/DS_2089.gz
>  /usr/share/i18n/charmaps/EBCDIC-DK-NO-A.gz
>  /usr/share/i18n/charmaps/MAC-CENTRALEUROPE.gz
>  /usr/share/i18n/charmaps/JOHAB.gz
>  /usr/share/i18n/charmaps/KOI8-T.gz
>  /usr/share/i18n/charmaps/MIK.gz
>  /usr/share/i18n/charmaps/JIS_C6229-1984-HAND-ADD.gz
>  /usr/share/i18n/charmaps/GEORGIAN-ACADEMY.gz
>  /usr/share/i18n/charmaps/EUC-TW.gz
>  /usr/share/i18n/charmaps/NATS-DANO-ADD.gz
>  /usr/share/i18n/charmaps/NS_4551-2.gz
>  /usr/share/i18n/charmaps/BIG5.gz
>  /usr/share/i18n/charmaps/EBCDIC-IS-FRISS.gz
>  /usr/share/i18n/charmaps/KOI-8.gz
>  /usr/share/i18n/charmaps/T.61-7BIT.gz
>  /usr/share/i18n/charmaps/ISO-8859-15.gz
>  /usr/share/i18n/charmaps/ISO-IR-197.gz
>  /usr/share/i18n/charmaps/EBCDIC-PT.gz
>  /usr/share/i18n/charmaps/IBM863.gz
>  /usr/share/i18n/charmaps/BS_VIEWDATA.gz
>  /usr/share/i18n/charmaps/IBM852.gz
>  /usr/share/i18n/charmaps/ISO-8859-13.gz
>  /usr/share/i18n/charmaps/IBM290.gz
>  /usr/share/i18n/charmaps/EBCDIC-ES-A.gz
>  /usr/share/i18n/charmaps/IBM275.gz
>  /usr/share/i18n/charmaps/ISO_8859-SUPP.gz
>  /usr/share/i18n/charmaps/JIS_C6229-1984-A.gz
>  /usr/share/i18n/charmaps/MACINTOSH.gz
>  /usr/share/i18n/charmaps/HP-GREEK8.gz
>  /usr/share/i18n/charmaps/ISO_8859-1,GL.gz
>  /usr/share/i18n/charmaps/INIS-8.gz
>  /usr/share/i18n/charmaps/EBCDIC-AT-DE-A.gz
>  /usr/share/i18n/charmaps/ECMA-CYRILLIC.gz
>  /usr/share/i18n/charmaps/JIS_C6220-1969-RO.gz
>  /usr/share/i18n/charmaps/EBCDIC-FR.gz
>  /usr/share/i18n/charmaps/IBM1124.gz
>  /usr/share/i18n/charmaps/BS_4730.gz
>  /usr/share/i18n/charmaps/IBM922.gz
>  /usr/share/i18n/charmaps/IBM280.gz
>  /usr/share/i18n/charmaps/IBM866.gz
>  /usr/share/i18n/charmaps/IBM903.gz
>  /usr/share/i18n/charmaps/MAC-CYRILLIC.gz
>  /usr/share/i18n/charmaps/EUC-JP-MS.gz
>  /usr/share/i18n/charmaps/DIN_66003.gz
>  /usr/share/i18n/charmaps/CP1125.gz
>  /usr/share/i18n/charmaps/HP-ROMAN9.gz
>  /usr/share/i18n/charmaps/EBCDIC-ES.gz
>  /usr/share/i18n/charmaps/ANSI_X3.4-1968.gz
>  /usr/share/i18n/charmaps/EUC-JISX0213.gz
>  /usr/share/i18n/charmaps/CP1258.gz
>  /usr/share/i18n/charmaps/NEXTSTEP.gz
>  /usr/share/i18n/charmaps/NATS-DANO.gz
>  /usr/share/i18n/charmaps/KOI8-U.gz
>  /usr/share/i18n/charmaps/GREEK7-OLD.gz
>  /usr/share/i18n/charmaps/ISO-8859-10.gz
>  /usr/share/i18n/charmaps/VIDEOTEX-SUPPL.gz
>  /usr/share/i18n/charmaps/EBCDIC-AT-DE.gz
>  /usr/share/i18n/charmaps/CP1253.gz
>  /usr/share/i18n/charmaps/CSN_369103.gz
>  /usr/share/i18n/charmaps/CP771.gz
>  /usr/share/i18n/charmaps/CP775.gz
>  /usr/share/i18n/charmaps/IBM891.gz
>  /usr/share/i18n/charmaps/CP1251.gz
>  /usr/share/i18n/charmaps/NF_Z_62-010_1973.gz
>  /usr/share/i18n/charmaps/EUC-JP.gz
>  /usr/share/i18n/charmaps/INIS.gz
>  /usr/share/i18n/charmaps/JUS_I.B1.002.gz
>  /usr/share/i18n/charmaps/JIS_X0201.gz
>  /usr/share/i18n/charmaps/IBM274.gz
>  /usr/share/i18n/charmaps/HP-TURKISH8.gz
>  /usr/share/i18n/charmaps/ISO-8859-1.gz
>  /usr/share/i18n/charmaps/IBM861.gz
>  /usr/share/i18n/charmaps/JUS_I.B1.003-SERB.gz
>  /usr/share/i18n/charmaps/IBM868.gz
>  /usr/share/i18n/charmaps/SEN_850200_B.gz
>  /usr/share/i18n/charmaps/IBM850.gz
>  /usr/share/i18n/charmaps/GB_1988-80.gz
>  /usr/share/i18n/charmaps/ASMO_449.gz
>  /usr/share/i18n/charmaps/CP1254.gz
>  /usr/share/i18n/charmaps/EBCDIC-DK-NO.gz
>  /usr/share/i18n/charmaps/BRF.gz
>  /usr/share/i18n/charmaps/NF_Z_62-010.gz
>  /usr/share/i18n/charmaps/ISO_6937.gz
>  /usr/share/i18n/charmaps/NATS-SEFI.gz
>  /usr/share/i18n/charmaps/PT154.gz
>  /usr/share/i18n/charmaps/ISO-8859-11.gz
>  /usr/share/i18n/charmaps/ARMSCII-8.gz
>  /usr/share/i18n/charmaps/ISO-8859-9.gz
>  /usr/share/i18n/charmaps/IBM037.gz
>  /usr/share/i18n/charmaps/ISO-8859-9E.gz
>  /usr/share/i18n/charmaps/LATIN-GREEK-1.gz
>  /usr/share/i18n/charmaps/ISO-8859-6.gz
>  /usr/share/i18n/charmaps/IBM1047.gz
>  /usr/share/i18n/charmaps/NS_4551-1.gz
>  /usr/share/i18n/charmaps/T.61-8BIT.gz
>  /usr/share/i18n/charmaps/IBM880.gz
>  /usr/share/i18n/charmaps/IBM851.gz
>  /usr/share/i18n/charmaps/CP1256.gz
>  /usr/share/i18n/charmaps/JIS_C6220-1969-JP.gz
>  /usr/share/i18n/charmaps/ES.gz
>  /usr/share/i18n/charmaps/IBM875.gz
>  /usr/share/i18n/charmaps/T.101-G2.gz
>  /usr/share/i18n/charmaps/NC_NC00-10.gz
>  /usr/share/i18n/charmaps/ES2.gz
>  /usr/share/i18n/charmaps/IBM285.gz
>  /usr/share/i18n/charmaps/IBM424.gz
>  /usr/share/i18n/charmaps/ISO_646.BASIC.gz
>  /usr/share/i18n/charmaps/ISO_2033-1983.gz
>  /usr/share/i18n/charmaps/CP773.gz
>  /usr/share/i18n/charmaps/IBM869.gz
>  /usr/share/i18n/charmaps/IBM857.gz
>  /usr/share/i18n/charmaps/IBM256.gz
>  /usr/share/i18n/charmaps/EUC-KR.gz
>  /usr/share/i18n/charmaps/SAMI-WS2.gz
>  /usr/share/i18n/charmaps/IT.gz
>  /usr/share/i18n/charmaps/ISO-IR-90.gz
>  /usr/share/i18n/charmaps/IBM1004.gz
>  /usr/share/i18n/charmaps/INIS-CYRILLIC.gz
>  /usr/share/i18n/charmaps/MSZ_7795.3.gz
>  /usr/share/i18n/charmaps/HP-ROMAN8.gz
>  /usr/share/i18n/charmaps/IBM500.gz
>  /usr/share/i18n/charmaps/ISO-8859-4.gz
>  /usr/share/i18n/charmaps/JIS_C6229-1984-KANA.gz
>  /usr/share/i18n/charmaps/IBM420.gz
>  /usr/share/i18n/charmaps/GREEK7.gz
>  /usr/share/i18n/charmaps/SHIFT_JIS.gz
>  /usr/share/i18n/charmaps/CP1250.gz
>  /usr/share/i18n/charmaps/CP1255.gz
>  /usr/share/i18n/charmaps/NATS-SEFI-ADD.gz
>  /usr/share/i18n/charmaps/IBM866NAV.gz
>  /usr/share/i18n/charmaps/IBM437.gz
>  /usr/share/i18n/charmaps/ISO-8859-14.gz
>  /usr/share/i18n/charmaps/GEORGIAN-PS.gz
>  /usr/share/i18n/charmaps/IBM870.gz
>  /usr/share/i18n/charmaps/IBM038.gz
>  /usr/share/i18n/charmaps/WINDOWS-31J.gz
>  /usr/share/i18n/charmaps/IBM855.gz
>  /usr/share/i18n/charmaps/CWI.gz
>  /usr/share/i18n/charmaps/IBM1026.gz
>  /usr/share/i18n/charmaps/IBM864.gz
>  /usr/share/i18n/charmaps/PT.gz
>  /usr/share/i18n/charmaps/EBCDIC-CA-FR.gz
>  /usr/share/i18n/charmaps/CP949.gz
>  /usr/share/i18n/charmaps/CP1252.gz
>  /usr/share/i18n/charmaps/GREEK-CCITT.gz
>  /usr/share/i18n/charmaps/ISO_6937-2-ADD.gz
>  /usr/share/i18n/charmaps/CP772.gz
>  /usr/share/i18n/charmaps/IBM860.gz
>  /usr/share/i18n/charmaps/JIS_C6229-1984-HAND.gz
>  /usr/share/i18n/charmaps/UTF-8.gz
>  /usr/share/i18n/charmaps/CSA_Z243.4-1985-1.gz
>  /usr/share/i18n/charmaps/CSA_Z243.4-1985-2.gz
>  /usr/share/i18n/charmaps/JIS_C6229-1984-B.gz
>  /usr/share/i18n/charmaps/IBM273.gz
>  /usr/share/i18n/charmaps/TCVN5712-1.gz
>  /usr/share/i18n/charmaps/GB2312.gz
>  /usr/share/i18n/charmaps/ISO_5427.gz
>  /usr/share/i18n/charmaps/IBM284.gz
>  /usr/share/i18n/charmaps/KOI8-RU.gz
>  /usr/share/i18n/charmaps/ISO_10646.gz
>  /usr/share/i18n/charmaps/ISO-8859-5.gz
>  /usr/share/i18n/charmaps/GB18030.gz
>  /usr/share/i18n/charmaps/JUS_I.B1.003-MAC.gz
>  /usr/share/i18n/charmaps/IBM277.gz
>  /usr/share/i18n/charmaps/ISO_10367-BOX.gz
>  /usr/share/i18n/charmaps/SEN_850200_C.gz
>  /usr/share/i18n/charmaps/ISO-8859-3.gz
>  /usr/share/i18n/charmaps/IBM904.gz
>  /usr/share/i18n/charmaps/TIS-620.gz
>  /usr/share/i18n/charmaps/IBM1132.gz
>  /usr/share/i18n/charmaps/TSCII.gz
>  /usr/share/i18n/charmaps/IBM281.gz
>  /usr/share/i18n/charmaps/EBCDIC-IT.gz
>  /usr/share/i18n/charmaps/IBM1133.gz
>  /usr/share/i18n/charmaps/ANSI_X3.110-1983.gz
>  /usr/share/i18n/charmaps/JIS_C6229-1984-B-ADD.gz
>  /usr/share/i18n/charmaps/IBM1163.gz
>  /usr/share/i18n/charmaps/CP770.gz
>  /usr/share/i18n/charmaps/CP774.gz
>  /usr/share/i18n/charmaps/IBM1164.gz
>  /usr/share/i18n/charmaps/RK1048.gz
>  /usr/share/i18n/charmaps/INVARIANT.gz
>  /usr/share/i18n/charmaps/GOST_19768-74.gz
>  /usr/share/i18n/charmaps/ISO-8859-16.gz
>  /usr/share/i18n/charmaps/IBM874.gz
>  /usr/share/i18n/charmaps/LATIN-GREEK.gz
>  /usr/share/i18n/charmaps/IBM423.gz
>  /usr/share/i18n/charmaps/KSC5636.gz
>  /usr/share/i18n/charmaps/BIG5-HKSCS.gz
>  /usr/share/i18n/charmaps/ISO_11548-1.gz
>  /usr/share/i18n/charmaps/EBCDIC-FI-SE.gz
>  /usr/share/i18n/charmaps/MAC-UK.gz
>  /usr/share/i18n/charmaps/PT2.gz
>  /usr/share/i18n/charmaps/ISO-8859-2.gz
>  /usr/share/i18n/charmaps/ISO-8859-7.gz
>  /usr/share/i18n/charmaps/IBM856.gz
>  /usr/share/i18n/charmaps/EBCDIC-UK.gz
>  /usr/share/i18n/charmaps/EBCDIC-ES-S.gz
>  /usr/share/i18n/charmaps/IBM1161.gz
>  /usr/share/i18n/charmaps/IBM1162.gz
>  /usr/share/i18n/charmaps/KOI8-R.gz
>  /usr/share/i18n/charmaps/ISO_5428.gz
>  /usr/share/i18n/charmaps/SAMI.gz
>  /usr/share/i18n/charmaps/IEC_P27-1.gz
>  /usr/share/i18n/charmaps/ISIRI-3342.gz
>  /usr/lib/gconv/CP770.so
>  /usr/lib/gconv/ISO-2022-CN-EXT.so
>  /usr/lib/gconv/UTF-32.so
>  /usr/lib/gconv/IBM870.so
>  /usr/lib/gconv/IBM1390.so
>  /usr/lib/gconv/CP1254.so
>  /usr/lib/gconv/ISO8859-8.so
>  /usr/lib/gconv/IBM1137.so
>  /usr/lib/gconv/CP1258.so
>  /usr/lib/gconv/SHIFT_JISX0213.so
>  /usr/lib/gconv/IBM905.so
>  /usr/lib/gconv/IBM281.so
>  /usr/lib/gconv/IBM1025.so
>  /usr/lib/gconv/ISO-2022-KR.so
>  /usr/lib/gconv/IBM921.so
>  /usr/lib/gconv/ISO8859-9E.so
>  /usr/lib/gconv/IBM1147.so
>  /usr/lib/gconv/libKSC.so
>  /usr/lib/gconv/IBM1388.so
>  /usr/lib/gconv/IBM4909.so
>  /usr/lib/gconv/UHC.so
>  /usr/lib/gconv/HP-THAI8.so
>  /usr/lib/gconv/MACINTOSH.so
>  /usr/lib/gconv/IBM1008.so
>  /usr/lib/gconv/EBCDIC-US.so
>  /usr/lib/gconv/GOST_19768-74.so
>  /usr/lib/gconv/libCNS.so
>  /usr/lib/gconv/IBM932.so
>  /usr/lib/gconv/IBM437.so
>  /usr/lib/gconv/IBM943.so
>  /usr/lib/gconv/TSCII.so
>  /usr/lib/gconv/IBM277.so
>  /usr/lib/gconv/DEC-MCS.so
>  /usr/lib/gconv/IBM866.so
>  /usr/lib/gconv/ARMSCII-8.so
>  /usr/lib/gconv/HP-ROMAN8.so
>  /usr/lib/gconv/IBM1148.so
>  /usr/lib/gconv/VISCII.so
>  /usr/lib/gconv/ISO_5427-EXT.so
>  /usr/lib/gconv/IBM1371.so
>  /usr/lib/gconv/ISO8859-7.so
>  /usr/lib/gconv/ISO8859-14.so
>  /usr/lib/gconv/EBCDIC-DK-NO-A.so
>  /usr/lib/gconv/IBM9030.so
>  /usr/lib/gconv/IBM937.so
>  /usr/lib/gconv/IBM851.so
>  /usr/lib/gconv/MAC-CENTRALEUROPE.so
>  /usr/lib/gconv/IBM857.so
>  /usr/lib/gconv/ISO-2022-JP.so
>  /usr/lib/gconv/SJIS.so
>  /usr/lib/gconv/KOI-8.so
>  /usr/lib/gconv/IBM935.so
>  /usr/lib/gconv/IBM278.so
>  /usr/lib/gconv/IBM9066.so
>  /usr/lib/gconv/LATIN-GREEK-1.so
>  /usr/lib/gconv/ISO_2033.so
>  /usr/lib/gconv/NATS-SEFI.so
>  /usr/lib/gconv/ISO_6937-2.so
>  /usr/lib/gconv/ISO_5428.so
>  /usr/lib/gconv/IBM285.so
>  /usr/lib/gconv/libJIS.so
>  /usr/lib/gconv/ISO_10367-BOX.so
>  /usr/lib/gconv/IBM1122.so
>  /usr/lib/gconv/EUC-JP-MS.so
>  /usr/lib/gconv/IBM420.so
>  /usr/lib/gconv/IBM424.so
>  /usr/lib/gconv/IBM1141.so
>  /usr/lib/gconv/CWI.so
>  /usr/lib/gconv/EUC-TW.so
>  /usr/lib/gconv/IBM1130.so
>  /usr/lib/gconv/IBM891.so
>  /usr/lib/gconv/HP-ROMAN9.so
>  /usr/lib/gconv/IBM297.so
>  /usr/lib/gconv/EBCDIC-CA-FR.so
>  /usr/lib/gconv/CP772.so
>  /usr/lib/gconv/INIS-8.so
>  /usr/lib/gconv/IBM038.so
>  /usr/lib/gconv/CP1253.so
>  /usr/lib/gconv/BIG5.so
>  /usr/lib/gconv/SAMI-WS2.so
>  /usr/lib/gconv/IBM1161.so
>  /usr/lib/gconv/IBM1026.so
>  /usr/lib/gconv/CP1256.so
>  /usr/lib/gconv/HP-GREEK8.so
>  /usr/lib/gconv/IBM1144.so
>  /usr/lib/gconv/IBM1155.so
>  /usr/lib/gconv/MIK.so
>  /usr/lib/gconv/EUC-KR.so
>  /usr/lib/gconv/KOI8-RU.so
>  /usr/lib/gconv/gconv-modules
>  /usr/lib/gconv/GEORGIAN-PS.so
>  /usr/lib/gconv/libISOIR165.so
>  /usr/lib/gconv/ISO8859-1.so
>  /usr/lib/gconv/ISO_6937.so
>  /usr/lib/gconv/INIS-CYRILLIC.so
>  /usr/lib/gconv/EBCDIC-AT-DE.so
>  /usr/lib/gconv/IBM1166.so
>  /usr/lib/gconv/EUC-JP.so
>  /usr/lib/gconv/IBM855.so
>  /usr/lib/gconv/EBCDIC-IT.so
>  /usr/lib/gconv/ISO8859-5.so
>  /usr/lib/gconv/IBM803.so
>  /usr/lib/gconv/ISO-2022-CN.so
>  /usr/lib/gconv/libGB.so
>  /usr/lib/gconv/IBM1149.so
>  /usr/lib/gconv/ISO-2022-JP-3.so
>  /usr/lib/gconv/EBCDIC-IS-FRISS.so
>  /usr/lib/gconv/ASMO_449.so
>  /usr/lib/gconv/IBM1143.so
>  /usr/lib/gconv/IBM1164.so
>  /usr/lib/gconv/IBM903.so
>  /usr/lib/gconv/IEC_P27-1.so
>  /usr/lib/gconv/IBM1364.so
>  /usr/lib/gconv/ISO8859-4.so
>  /usr/lib/gconv/CP773.so
>  /usr/lib/gconv/ISIRI-3342.so
>  /usr/lib/gconv/IBM862.so
>  /usr/lib/gconv/GBK.so
>  /usr/lib/gconv/GB18030.so
>  /usr/lib/gconv/IBM256.so
>  /usr/lib/gconv/CP774.so
>  /usr/lib/gconv/IBM274.so
>  /usr/lib/gconv/ISO646.so
>  /usr/lib/gconv/IBM1047.so
>  /usr/lib/gconv/GBBIG5.so
>  /usr/lib/gconv/IBM1154.so
>  /usr/lib/gconv/IBM930.so
>  /usr/lib/gconv/ISO8859-16.so
>  /usr/lib/gconv/PT154.so
>  /usr/lib/gconv/IBM874.so
>  /usr/lib/gconv/IBM1160.so
>  /usr/lib/gconv/IBM869.so
>  /usr/lib/gconv/IBM904.so
>  /usr/lib/gconv/IBM863.so
>  /usr/lib/gconv/CSN_369103.so
>  /usr/lib/gconv/IBM852.so
>  /usr/lib/gconv/IBM4899.so
>  /usr/lib/gconv/EBCDIC-ES.so
>  /usr/lib/gconv/EBCDIC-FR.so
>  /usr/lib/gconv/IBM875.so
>  /usr/lib/gconv/MAC-UK.so
>  /usr/lib/gconv/IBM037.so
>  /usr/lib/gconv/ISO8859-9.so
>  /usr/lib/gconv/CP775.so
>  /usr/lib/gconv/KOI8-U.so
>  /usr/lib/gconv/CP737.so
>  /usr/lib/gconv/libJISX0213.so
>  /usr/lib/gconv/IBM864.so
>  /usr/lib/gconv/UTF-7.so
>  /usr/lib/gconv/ISO-IR-197.so
>  /usr/lib/gconv/IBM939.so
>  /usr/lib/gconv/IBM1112.so
>  /usr/lib/gconv/IBM861.so
>  /usr/lib/gconv/IBM866NAV.so
>  /usr/lib/gconv/IBM1097.so
>  /usr/lib/gconv/CP1125.so
>  /usr/lib/gconv/INIS.so
>  /usr/lib/gconv/TIS-620.so
>  /usr/lib/gconv/IBM868.so
>  /usr/lib/gconv/CP1250.so
>  /usr/lib/gconv/CP1252.so
>  /usr/lib/gconv/IBM871.so
>  /usr/lib/gconv/IBM273.so
>  /usr/lib/gconv/IBM1004.so
>  /usr/lib/gconv/TCVN5712-1.so
>  /usr/lib/gconv/ISO8859-3.so
>  /usr/lib/gconv/IBM4971.so
>  /usr/lib/gconv/CP1255.so
>  /usr/lib/gconv/IBM902.so
>  /usr/lib/gconv/IBM1123.so
>  /usr/lib/gconv/IBM284.so
>  /usr/lib/gconv/IBM850.so
>  /usr/lib/gconv/GEORGIAN-ACADEMY.so
>  /usr/lib/gconv/IBM5347.so
>  /usr/lib/gconv/ANSI_X3.110.so
>  /usr/lib/gconv/GREEK7-OLD.so
>  /usr/lib/gconv/IBM290.so
>  /usr/lib/gconv/LATIN-GREEK.so
>  /usr/lib/gconv/IBM12712.so
>  /usr/lib/gconv/KOI8-R.so
>  /usr/lib/gconv/ISO-IR-209.so
>  /usr/lib/gconv/IBM1129.so
>  /usr/lib/gconv/KOI8-T.so
>  /usr/lib/gconv/ECMA-CYRILLIC.so
>  /usr/lib/gconv/IBM933.so
>  /usr/lib/gconv/NATS-DANO.so
>  /usr/lib/gconv/IBM1158.so
>  /usr/lib/gconv/EBCDIC-FI-SE-A.so
>  /usr/lib/gconv/GREEK7.so
>  /usr/lib/gconv/CP1257.so
>  /usr/lib/gconv/IBM865.so
>  /usr/lib/gconv/MAC-IS.so
>  /usr/lib/gconv/EBCDIC-FI-SE.so
>  /usr/lib/gconv/IBM16804.so
>  /usr/lib/gconv/GBGBK.so
>  /usr/lib/gconv/IBM1167.so
>  /usr/lib/gconv/ISO8859-6.so
>  /usr/lib/gconv/T.61.so
>  /usr/lib/gconv/EBCDIC-AT-DE-A.so
>  /usr/lib/gconv/HP-TURKISH8.so
>  /usr/lib/gconv/UNICODE.so
>  /usr/lib/gconv/EBCDIC-ES-S.so
>  /usr/lib/gconv/JOHAB.so
>  /usr/lib/gconv/IBM4517.so
>  /usr/lib/gconv/EUC-CN.so
>  /usr/lib/gconv/IBM901.so
>  /usr/lib/gconv/ISO8859-10.so
>  /usr/lib/gconv/IBM1132.so
>  /usr/lib/gconv/IBM1140.so
>  /usr/lib/gconv/IBM1146.so
>  /usr/lib/gconv/ISO_11548-1.so
>  /usr/lib/gconv/IBM1133.so
>  /usr/lib/gconv/IBM1046.so
>  /usr/lib/gconv/IBM922.so
>  /usr/lib/gconv/IBM918.so
>  /usr/lib/gconv/EBCDIC-PT.so
>  /usr/lib/gconv/ISO8859-11.so
>  /usr/lib/gconv/IBM1162.so
>  /usr/lib/gconv/EUC-JISX0213.so
>  /usr/lib/gconv/IBM1153.so
>  /usr/lib/gconv/IBM1145.so
>  /usr/lib/gconv/IBM860.so
>  /usr/lib/gconv/IBM1157.so
>  /usr/lib/gconv/IBM880.so
>  /usr/lib/gconv/UTF-16.so
>  /usr/lib/gconv/CP1251.so
>  /usr/lib/gconv/IBM1156.so
>  /usr/lib/gconv/ISO_5427.so
>  /usr/lib/gconv/CP932.so
>  /usr/lib/gconv/BRF.so
>  /usr/lib/gconv/IBM1399.so
>  /usr/lib/gconv/IBM856.so
>  /usr/lib/gconv/RK1048.so
>  /usr/lib/gconv/EBCDIC-ES-A.so
>  /usr/lib/gconv/ISO8859-2.so
>  /usr/lib/gconv/EBCDIC-DK-NO.so
>  /usr/lib/gconv/IBM280.so
>  /usr/lib/gconv/IBM423.so
>  /usr/lib/gconv/IBM1163.so
>  /usr/lib/gconv/BIG5HKSCS.so
>  /usr/lib/gconv/EBCDIC-UK.so
>  /usr/lib/gconv/ISO8859-15.so
>  /usr/lib/gconv/GREEK-CCITT.so
>  /usr/lib/gconv/CP771.so
>  /usr/lib/gconv/ISO8859-13.so
>  /usr/lib/gconv/IBM275.so
>  /usr/lib/gconv/IBM1142.so
>  /usr/lib/gconv/IBM9448.so
>  /usr/lib/gconv/MAC-SAMI.so
>  /usr/lib/gconv/IBM500.so
>  /usr/lib/gconv/IBM1124.so
>  /usr/lib/gconv/IBM1008_420.so
>  /usr/lib/gconv/CP10007.so
> Please set FILES such that these items are packaged. Alternatively if the=
y
> are unneeded, avoid installing them or delete them within do_install.
> glibc-locale: 820 installed and not shipped files. [installed-vs-shipped]
> ERROR: glibc-locale-2.24-r0 do_package: Fatal QA errors found, failing
> task.
> ERROR: glibc-locale-2.24-r0 do_package: Function failed: do_package
> ERROR: Logfile of failure stored in: /mnt/dude/yocto/poky/build/tmp
> /work/core2-64-poky-linux/glibc-locale/2.24-r0/temp/log.do_package.21254
> ERROR: Task (/mnt/dude/yocto/poky/meta/recipes-core/glibc/glibc-locale_
> 2.24.bb:do_package) failed with exit code '1'
> Waiting for 4 running tasks to finish:
> 0: linux-yocto-4.8.3+gitAUTOINC+83110d94ed_1adf9d3633-r0
> do_compile_kernelmodules - 249s (pid 21240)
> 1: openssl-1.0.2j-r0 do_compile - 126s (pid 9144)
> 2: ncurses-6.0+20160625-r0 do_configure - 90s (pid 14798)
> 3: expat-2.2.0-r0 do_configure - 21s (pid 23842)
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114750b0c8a91d054157fefb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 15, 2016 at 5:52 AM, Andrew Stuart <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:andrew.stuart@supercoders.com.au" target=3D"_blank">andrew.=
stuart@supercoders.<wbr>com.au</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi Bruce - sorry to prod, any guesses as to why the errors be=
low?<br></blockquote><div><br></div><div>The glibc-locale ones ?<br><br></d=
iv><div>Unfortunately not. I have had some locale issues in the past, but n=
ot what you<br></div><div>are seeing there.<br><br></div><div>Whatever is t=
riggering it, isn&#39;t specific to meta-virt or Xen, so you might try aski=
ng<br></div><div>the question in a broader forum, like the oe-core mailing =
list. Someone there who&#39;s<br></div><div>more familiar with the locale g=
eneration should be able to point you in the right<br></div><div>direction.=
<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<br>
thanks<br>
<span class=3D"m_5183960328307139582HOEnZb"><font color=3D"#888888"><br>
Andrew<br>
</font></span><div class=3D"m_5183960328307139582HOEnZb"><div class=3D"m_51=
83960328307139582h5"><br>
<br>
&gt;&gt; What branch are you building (of poky/oe-core and of meta-virt) ? =
It really shouldn=E2=80=99t matter, but it can be relevant .. so best to as=
k right away.<br>
<br>
I=E2=80=99m not sure the answer to that.=C2=A0 How would I know which branc=
h I=E2=80=99m building?<br>
<br>
&gt;&gt; Also have you put &#39;xen&#39; in your DISTRO_FEATURES ? (it can =
be done in your local.conf). Those kernel configs are only added/enabled wh=
en xen is found in the distro config.<br>
<br>
When I do:<br>
bitbake xen-guest-image-minimal<br>
<br>
It builds fine.<br>
<br>
I then add DISTRO_FEATURES=3D=E2=80=9Cxen=E2=80=9D to the end of my conf/lo=
cal.conf and do exactly the same thing (bitbake xen-guest-image-minimal)<br=
>
<br>
Which results in the following errors.=C2=A0 Any guesses?<br>
<br>
thanks!<br>
<br>
<br>
ubuntu@ugbuildserver:/mnt/dude<wbr>/yocto/poky/build$ bitbake xen-guest-ima=
ge-minimal<br>
Parsing recipes: 100% |#############################<wbr>##################=
############<wbr>##############################<wbr>#######################=
#######<wbr>#####################| Time: 0:01:08<br>
Parsing of 1903 .bb files complete (0 cached, 1903 parsed). 2597 targets, 3=
51 skipped, 0 masked, 0 errors.<br>
NOTE: There are 3 recipes to be removed from sysroot x86_64, removing...<br=
>
NOTE: There are 1 recipes to be removed from sysroot allarch, removing...<b=
r>
NOTE: There are 24 recipes to be removed from sysroot core2-64, removing...=
<br>
NOTE: There are 25 recipes to be removed from sysroot qemux86-64, removing.=
..<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.32.0&quot;<br>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-poky-linux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;qemux86-64&quot;<=
br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;2.2&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>
meta<br>
meta-poky<br>
meta-yocto-bsp<br>
meta-webserver=C2=A0 =C2=A0 =3D &quot;morty:dc8508f609974cc99606b90<wbr>42b=
fa7f870ce80228&quot;<br>
meta-virtualization =3D &quot;master:011c4d611b3ce4e4922207<wbr>ea0f58fd475=
eab83fb&quot;<br>
meta-networking<br>
meta-oe<br>
meta-python<br>
meta-filesystems=C2=A0 =3D &quot;morty:dc8508f609974cc99606b90<wbr>42bfa7f8=
70ce80228&quot;<br>
<br>
Initialising tasks: 100% |#############################<wbr>###############=
###############<wbr>##############################<wbr>####################=
##########<wbr>##################| Time: 0:00:04<br>
NOTE: Executing SetScene Tasks<br>
NOTE: Executing RunQueue Tasks<br>
ERROR: glibc-locale-2.24-r0 do_package: QA Issue: glibc-locale: Files/direc=
tories were installed but not shipped in any package:<br>
=C2=A0/usr/share/i18n<br>
=C2=A0/usr/share/i18n/locales<br>
=C2=A0/usr/share/i18n/charmaps<br>
=C2=A0/usr/share/i18n/locales/kw_GB<br>
=C2=A0/usr/share/i18n/locales/ug_CN<br>
=C2=A0/usr/share/i18n/locales/as_IN<br>
=C2=A0/usr/share/i18n/locales/sa_IN<br>
=C2=A0/usr/share/i18n/locales/mhr_<wbr>RU<br>
=C2=A0/usr/share/i18n/locales/ml_IN<br>
=C2=A0/usr/share/i18n/locales/ak_GH<br>
=C2=A0/usr/share/i18n/locales/tg_TJ<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_compat<br>
=C2=A0/usr/share/i18n/locales/fr_FR<br>
=C2=A0/usr/share/i18n/locales/sl_SI<br>
=C2=A0/usr/share/i18n/locales/xh_ZA<br>
=C2=A0/usr/share/i18n/locales/lv_LV<br>
=C2=A0/usr/share/i18n/locales/de_DE<br>
=C2=A0/usr/share/i18n/locales/bn_BD<br>
=C2=A0/usr/share/i18n/locales/so_DJ<br>
=C2=A0/usr/share/i18n/locales/ku_TR<br>
=C2=A0/usr/share/i18n/locales/es_AR<br>
=C2=A0/usr/share/i18n/locales/yi_US<br>
=C2=A0/usr/share/i18n/locales/pt_PT<br>
=C2=A0/usr/share/i18n/locales/it_<wbr>IT@euro<br>
=C2=A0/usr/share/i18n/locales/st_ZA<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_cjk_variants<br>
=C2=A0/usr/share/i18n/locales/en_HK<br>
=C2=A0/usr/share/i18n/locales/ga_<wbr>IE@euro<br>
=C2=A0/usr/share/i18n/locales/ur_PK<br>
=C2=A0/usr/share/i18n/locales/tr_TR<br>
=C2=A0/usr/share/i18n/locales/aa_ER<br>
=C2=A0/usr/share/i18n/locales/nl_AW<br>
=C2=A0/usr/share/i18n/locales/tt_<wbr>RU@iqtelif<br>
=C2=A0/usr/share/i18n/locales/es_CL<br>
=C2=A0/usr/share/i18n/locales/en_<wbr>IE@euro<br>
=C2=A0/usr/share/i18n/locales/csb_<wbr>PL<br>
=C2=A0/usr/share/i18n/locales/de_BE<br>
=C2=A0/usr/share/i18n/locales/br_FR<br>
=C2=A0/usr/share/i18n/locales/es_GT<br>
=C2=A0/usr/share/i18n/locales/lg_UG<br>
=C2=A0/usr/share/i18n/locales/os_RU<br>
=C2=A0/usr/share/i18n/locales/uz_UZ<br>
=C2=A0/usr/share/i18n/locales/de_<wbr>BE@euro<br>
=C2=A0/usr/share/i18n/locales/mk_MK<br>
=C2=A0/usr/share/i18n/locales/nl_<wbr>NL@euro<br>
=C2=A0/usr/share/i18n/locales/i18n<br>
=C2=A0/usr/share/i18n/locales/ka_GE<br>
=C2=A0/usr/share/i18n/locales/shs_<wbr>CA<br>
=C2=A0/usr/share/i18n/locales/gu_IN<br>
=C2=A0/usr/share/i18n/locales/cs_CZ<br>
=C2=A0/usr/share/i18n/locales/pap_<wbr>AW<br>
=C2=A0/usr/share/i18n/locales/ar_AE<br>
=C2=A0/usr/share/i18n/locales/gez_<wbr>ET<br>
=C2=A0/usr/share/i18n/locales/ha_NG<br>
=C2=A0/usr/share/i18n/locales/nso_<wbr>ZA<br>
=C2=A0/usr/share/i18n/locales/en_DK<br>
=C2=A0/usr/share/i18n/locales/sq_MK<br>
=C2=A0/usr/share/i18n/locales/en_CA<br>
=C2=A0/usr/share/i18n/locales/sr_ME<br>
=C2=A0/usr/share/i18n/locales/sgs_<wbr>LT<br>
=C2=A0/usr/share/i18n/locales/fr_<wbr>BE@euro<br>
=C2=A0/usr/share/i18n/locales/es_MX<br>
=C2=A0/usr/share/i18n/locales/en_NZ<br>
=C2=A0/usr/share/i18n/locales/ga_IE<br>
=C2=A0/usr/share/i18n/locales/ar_IN<br>
=C2=A0/usr/share/i18n/locales/pap_<wbr>CW<br>
=C2=A0/usr/share/i18n/locales/ru_RU<br>
=C2=A0/usr/share/i18n/locales/es_US<br>
=C2=A0/usr/share/i18n/locales/es_PY<br>
=C2=A0/usr/share/i18n/locales/nl_NL<br>
=C2=A0/usr/share/i18n/locales/es_ES<br>
=C2=A0/usr/share/i18n/locales/en_IN<br>
=C2=A0/usr/share/i18n/locales/pl_PL<br>
=C2=A0/usr/share/i18n/locales/sq_AL<br>
=C2=A0/usr/share/i18n/locales/ca_ES<br>
=C2=A0/usr/share/i18n/locales/zh_CN<br>
=C2=A0/usr/share/i18n/locales/ks_<wbr>IN@devanagari<br>
=C2=A0/usr/share/i18n/locales/gez_E<wbr>R@abegede<br>
=C2=A0/usr/share/i18n/locales/de_LI<br>
=C2=A0/usr/share/i18n/locales/fil_<wbr>PH<br>
=C2=A0/usr/share/i18n/locales/pa_IN<br>
=C2=A0/usr/share/i18n/locales/ig_NG<br>
=C2=A0/usr/share/i18n/locales/brx_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/is_IS<br>
=C2=A0/usr/share/i18n/locales/en_AU<br>
=C2=A0/usr/share/i18n/locales/gez_<wbr>ER<br>
=C2=A0/usr/share/i18n/locales/bem_<wbr>ZM<br>
=C2=A0/usr/share/i18n/locales/sr_<wbr>RS@latin<br>
=C2=A0/usr/share/i18n/locales/mr_IN<br>
=C2=A0/usr/share/i18n/locales/ca_AD<br>
=C2=A0/usr/share/i18n/locales/ro_RO<br>
=C2=A0/usr/share/i18n/locales/kk_KZ<br>
=C2=A0/usr/share/i18n/locales/te_IN<br>
=C2=A0/usr/share/i18n/locales/en_ZW<br>
=C2=A0/usr/share/i18n/locales/dv_MV<br>
=C2=A0/usr/share/i18n/locales/az_AZ<br>
=C2=A0/usr/share/i18n/locales/aa_ET<br>
=C2=A0/usr/share/i18n/locales/es_CU<br>
=C2=A0/usr/share/i18n/locales/id_ID<br>
=C2=A0/usr/share/i18n/locales/wal_<wbr>ET<br>
=C2=A0/usr/share/i18n/locales/bho_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/es_BO<br>
=C2=A0/usr/share/i18n/locales/hak_<wbr>TW<br>
=C2=A0/usr/share/i18n/locales/ru_UA<br>
=C2=A0/usr/share/i18n/locales/zu_ZA<br>
=C2=A0/usr/share/i18n/locales/uz_<wbr>UZ@cyrillic<br>
=C2=A0/usr/share/i18n/locales/be_<wbr>BY@latin<br>
=C2=A0/usr/share/i18n/locales/be_BY<br>
=C2=A0/usr/share/i18n/locales/ca_FR<br>
=C2=A0/usr/share/i18n/locales/it_CH<br>
=C2=A0/usr/share/i18n/locales/sd_<wbr>IN@devanagari<br>
=C2=A0/usr/share/i18n/locales/sid_<wbr>ET<br>
=C2=A0/usr/share/i18n/locales/de_<wbr>AT@euro<br>
=C2=A0/usr/share/i18n/locales/tt_RU<br>
=C2=A0/usr/share/i18n/locales/hi_IN<br>
=C2=A0/usr/share/i18n/locales/ar_YE<br>
=C2=A0/usr/share/i18n/locales/POSIX<br>
=C2=A0/usr/share/i18n/locales/ne_NP<br>
=C2=A0/usr/share/i18n/locales/sc_IT<br>
=C2=A0/usr/share/i18n/locales/am_ET<br>
=C2=A0/usr/share/i18n/locales/fi_FI<br>
=C2=A0/usr/share/i18n/locales/fr_<wbr>LU@euro<br>
=C2=A0/usr/share/i18n/locales/km_KH<br>
=C2=A0/usr/share/i18n/locales/niu_<wbr>NU<br>
=C2=A0/usr/share/i18n/locales/chr_<wbr>US<br>
=C2=A0/usr/share/i18n/locales/tr_CY<br>
=C2=A0/usr/share/i18n/locales/nl_<wbr>BE@euro<br>
=C2=A0/usr/share/i18n/locales/ar_SD<br>
=C2=A0/usr/share/i18n/locales/ber_<wbr>MA<br>
=C2=A0/usr/share/i18n/locales/yo_NG<br>
=C2=A0/usr/share/i18n/locales/en_IE<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_narrow<br>
=C2=A0/usr/share/i18n/locales/ss_ZA<br>
=C2=A0/usr/share/i18n/locales/cmn_<wbr>TW<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_wide<br>
=C2=A0/usr/share/i18n/locales/om_ET<br>
=C2=A0/usr/share/i18n/locales/af_ZA<br>
=C2=A0/usr/share/i18n/locales/byn_<wbr>ER<br>
=C2=A0/usr/share/i18n/locales/ik_CA<br>
=C2=A0/usr/share/i18n/locales/fy_DE<br>
=C2=A0/usr/share/i18n/locales/tk_TM<br>
=C2=A0/usr/share/i18n/locales/kn_IN<br>
=C2=A0/usr/share/i18n/locales/niu_<wbr>NZ<br>
=C2=A0/usr/share/i18n/locales/gl_ES<br>
=C2=A0/usr/share/i18n/locales/or_IN<br>
=C2=A0/usr/share/i18n/locales/eo<br>
=C2=A0/usr/share/i18n/locales/tcy_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/ar_SS<br>
=C2=A0/usr/share/i18n/locales/ca_IT<br>
=C2=A0/usr/share/i18n/locales/nan_T<wbr>W@latin<br>
=C2=A0/usr/share/i18n/locales/es_PA<br>
=C2=A0/usr/share/i18n/locales/ti_ET<br>
=C2=A0/usr/share/i18n/locales/oc_FR<br>
=C2=A0/usr/share/i18n/locales/wa_<wbr>BE@euro<br>
=C2=A0/usr/share/i18n/locales/th_TH<br>
=C2=A0/usr/share/i18n/locales/en_GB<br>
=C2=A0/usr/share/i18n/locales/ayc_<wbr>PE<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_cjk_compat<br>
=C2=A0/usr/share/i18n/locales/br_<wbr>FR@euro<br>
=C2=A0/usr/share/i18n/locales/mg_MG<br>
=C2=A0/usr/share/i18n/locales/cy_GB<br>
=C2=A0/usr/share/i18n/locales/fo_FO<br>
=C2=A0/usr/share/i18n/locales/ar_TN<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_circle<br>
=C2=A0/usr/share/i18n/locales/szl_<wbr>PL<br>
=C2=A0/usr/share/i18n/locales/fr_LU<br>
=C2=A0/usr/share/i18n/locales/ar_LB<br>
=C2=A0/usr/share/i18n/locales/sv_<wbr>FI@euro<br>
=C2=A0/usr/share/i18n/locales/mn_MN<br>
=C2=A0/usr/share/i18n/locales/fur_<wbr>IT<br>
=C2=A0/usr/share/i18n/locales/zh_HK<br>
=C2=A0/usr/share/i18n/locales/ks_IN<br>
=C2=A0/usr/share/i18n/locales/ar_DZ<br>
=C2=A0/usr/share/i18n/locales/so_ET<br>
=C2=A0/usr/share/i18n/locales/ja_JP<br>
=C2=A0/usr/share/i18n/locales/ta_LK<br>
=C2=A0/usr/share/i18n/locales/el_GR<br>
=C2=A0/usr/share/i18n/locales/sat_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/uk_UA<br>
=C2=A0/usr/share/i18n/locales/es_UY<br>
=C2=A0/usr/share/i18n/locales/kl_GL<br>
=C2=A0/usr/share/i18n/locales/sv_FI<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_small<br>
=C2=A0/usr/share/i18n/locales/ky_KG<br>
=C2=A0/usr/share/i18n/locales/doi_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/hy_AM<br>
=C2=A0/usr/share/i18n/locales/se_NO<br>
=C2=A0/usr/share/i18n/locales/quz_<wbr>PE<br>
=C2=A0/usr/share/i18n/locales/wae_<wbr>CH<br>
=C2=A0/usr/share/i18n/locales/raj_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/sv_SE<br>
=C2=A0/usr/share/i18n/locales/el_<wbr>GR@euro<br>
=C2=A0/usr/share/i18n/locales/tig_<wbr>ER<br>
=C2=A0/usr/share/i18n/locales/en_PH<br>
=C2=A0/usr/share/i18n/locales/fr_BE<br>
=C2=A0/usr/share/i18n/locales/de_CH<br>
=C2=A0/usr/share/i18n/locales/tn_ZA<br>
=C2=A0/usr/share/i18n/locales/en_US<br>
=C2=A0/usr/share/i18n/locales/iso14<wbr>651_t1_pinyin<br>
=C2=A0/usr/share/i18n/locales/es_VE<br>
=C2=A0/usr/share/i18n/locales/de_LU<br>
=C2=A0/usr/share/i18n/locales/ln_CD<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_font<br>
=C2=A0/usr/share/i18n/locales/ts_ZA<br>
=C2=A0/usr/share/i18n/locales/fy_NL<br>
=C2=A0/usr/share/i18n/locales/ce_RU<br>
=C2=A0/usr/share/i18n/locales/an_ES<br>
=C2=A0/usr/share/i18n/locales/es_NI<br>
=C2=A0/usr/share/i18n/locales/ar_SY<br>
=C2=A0/usr/share/i18n/locales/es_PR<br>
=C2=A0/usr/share/i18n/locales/nhn_<wbr>MX<br>
=C2=A0/usr/share/i18n/locales/gez_E<wbr>T@abegede<br>
=C2=A0/usr/share/i18n/locales/hr_HR<br>
=C2=A0/usr/share/i18n/locales/ia_FR<br>
=C2=A0/usr/share/i18n/locales/bg_BG<br>
=C2=A0/usr/share/i18n/locales/sw_KE<br>
=C2=A0/usr/share/i18n/locales/ko_KR<br>
=C2=A0/usr/share/i18n/locales/mni_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/anp_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/hne_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/bs_BA<br>
=C2=A0/usr/share/i18n/locales/li_BE<br>
=C2=A0/usr/share/i18n/locales/ar_LY<br>
=C2=A0/usr/share/i18n/locales/mag_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/en_ZM<br>
=C2=A0/usr/share/i18n/locales/eu_<wbr>ES@euro<br>
=C2=A0/usr/share/i18n/locales/da_DK<br>
=C2=A0/usr/share/i18n/locales/ar_IQ<br>
=C2=A0/usr/share/i18n/locales/de_<wbr>LU@euro<br>
=C2=A0/usr/share/i18n/locales/ti_ER<br>
=C2=A0/usr/share/i18n/locales/iso14<wbr>651_t1<br>
=C2=A0/usr/share/i18n/locales/ca_<wbr>ES@euro<br>
=C2=A0/usr/share/i18n/locales/de_<wbr>DE@euro<br>
=C2=A0/usr/share/i18n/locales/fr_CA<br>
=C2=A0/usr/share/i18n/locales/zh_TW<br>
=C2=A0/usr/share/i18n/locales/fr_<wbr>FR@euro<br>
=C2=A0/usr/share/i18n/locales/si_LK<br>
=C2=A0/usr/share/i18n/locales/bo_IN<br>
=C2=A0/usr/share/i18n/locales/el_CY<br>
=C2=A0/usr/share/i18n/locales/crh_<wbr>UA<br>
=C2=A0/usr/share/i18n/locales/nds_<wbr>DE<br>
=C2=A0/usr/share/i18n/locales/sk_SK<br>
=C2=A0/usr/share/i18n/locales/yue_<wbr>HK<br>
=C2=A0/usr/share/i18n/locales/cv_RU<br>
=C2=A0/usr/share/i18n/locales/my_MM<br>
=C2=A0/usr/share/i18n/locales/sr_RS<br>
=C2=A0/usr/share/i18n/locales/hsb_<wbr>DE<br>
=C2=A0/usr/share/i18n/locales/lb_LU<br>
=C2=A0/usr/share/i18n/locales/en_SG<br>
=C2=A0/usr/share/i18n/locales/ber_<wbr>DZ<br>
=C2=A0/usr/share/i18n/locales/iso14<wbr>651_t1_common<br>
=C2=A0/usr/share/i18n/locales/ar_KW<br>
=C2=A0/usr/share/i18n/locales/dz_BT<br>
=C2=A0/usr/share/i18n/locales/en_AG<br>
=C2=A0/usr/share/i18n/locales/so_SO<br>
=C2=A0/usr/share/i18n/locales/fr_CH<br>
=C2=A0/usr/share/i18n/locales/eu_ES<br>
=C2=A0/usr/share/i18n/locales/aa_DJ<br>
=C2=A0/usr/share/i18n/locales/bn_IN<br>
=C2=A0/usr/share/i18n/locales/es_EC<br>
=C2=A0/usr/share/i18n/locales/lo_LA<br>
=C2=A0/usr/share/i18n/locales/mi_NZ<br>
=C2=A0/usr/share/i18n/locales/lij_<wbr>IT<br>
=C2=A0/usr/share/i18n/locales/pt_BR<br>
=C2=A0/usr/share/i18n/locales/om_KE<br>
=C2=A0/usr/share/i18n/locales/mt_MT<br>
=C2=A0/usr/share/i18n/locales/wa_BE<br>
=C2=A0/usr/share/i18n/locales/vi_VN<br>
=C2=A0/usr/share/i18n/locales/ve_ZA<br>
=C2=A0/usr/share/i18n/locales/de_IT<br>
=C2=A0/usr/share/i18n/locales/en_BW<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_combining<br>
=C2=A0/usr/share/i18n/locales/es_CR<br>
=C2=A0/usr/share/i18n/locales/sd_IN<br>
=C2=A0/usr/share/i18n/locales/en_ZA<br>
=C2=A0/usr/share/i18n/locales/de_AT<br>
=C2=A0/usr/share/i18n/locales/aa_<wbr>ER@saaho<br>
=C2=A0/usr/share/i18n/locales/es_PE<br>
=C2=A0/usr/share/i18n/locales/lzh_<wbr>TW<br>
=C2=A0/usr/share/i18n/locales/ta_IN<br>
=C2=A0/usr/share/i18n/locales/es_CO<br>
=C2=A0/usr/share/i18n/locales/nl_BE<br>
=C2=A0/usr/share/i18n/locales/nn_NO<br>
=C2=A0/usr/share/i18n/locales/ar_OM<br>
=C2=A0/usr/share/i18n/locales/ar_EG<br>
=C2=A0/usr/share/i18n/locales/ar_SA<br>
=C2=A0/usr/share/i18n/locales/ff_SN<br>
=C2=A0/usr/share/i18n/locales/ar_BH<br>
=C2=A0/usr/share/i18n/locales/es_DO<br>
=C2=A0/usr/share/i18n/locales/wo_SN<br>
=C2=A0/usr/share/i18n/locales/pt_<wbr>PT@euro<br>
=C2=A0/usr/share/i18n/locales/the_<wbr>NP<br>
=C2=A0/usr/share/i18n/locales/hu_HU<br>
=C2=A0/usr/share/i18n/locales/nr_ZA<br>
=C2=A0/usr/share/i18n/locales/kok_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/en_IL<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_neutral<br>
=C2=A0/usr/share/i18n/locales/fi_<wbr>FI@euro<br>
=C2=A0/usr/share/i18n/locales/pa_PK<br>
=C2=A0/usr/share/i18n/locales/ur_IN<br>
=C2=A0/usr/share/i18n/locales/et_EE<br>
=C2=A0/usr/share/i18n/locales/ps_AF<br>
=C2=A0/usr/share/i18n/locales/fa_IR<br>
=C2=A0/usr/share/i18n/locales/rw_RW<br>
=C2=A0/usr/share/i18n/locales/it_IT<br>
=C2=A0/usr/share/i18n/locales/he_IL<br>
=C2=A0/usr/share/i18n/locales/gl_<wbr>ES@euro<br>
=C2=A0/usr/share/i18n/locales/ht_HT<br>
=C2=A0/usr/share/i18n/locales/ar_QA<br>
=C2=A0/usr/share/i18n/locales/ar_MA<br>
=C2=A0/usr/share/i18n/locales/nb_NO<br>
=C2=A0/usr/share/i18n/locales/es_<wbr>ES@euro<br>
=C2=A0/usr/share/i18n/locales/en_NG<br>
=C2=A0/usr/share/i18n/locales/li_NL<br>
=C2=A0/usr/share/i18n/locales/tl_PH<br>
=C2=A0/usr/share/i18n/locales/nds_<wbr>NL<br>
=C2=A0/usr/share/i18n/locales/bhb_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/mai_<wbr>IN<br>
=C2=A0/usr/share/i18n/locales/gd_GB<br>
=C2=A0/usr/share/i18n/locales/zh_SG<br>
=C2=A0/usr/share/i18n/locales/unm_<wbr>US<br>
=C2=A0/usr/share/i18n/locales/ar_JO<br>
=C2=A0/usr/share/i18n/locales/gv_GB<br>
=C2=A0/usr/share/i18n/locales/ast_<wbr>ES<br>
=C2=A0/usr/share/i18n/locales/so_KE<br>
=C2=A0/usr/share/i18n/locales/nan_<wbr>TW<br>
=C2=A0/usr/share/i18n/locales/ms_MY<br>
=C2=A0/usr/share/i18n/locales/iu_CA<br>
=C2=A0/usr/share/i18n/locales/lt_LT<br>
=C2=A0/usr/share/i18n/locales/sw_TZ<br>
=C2=A0/usr/share/i18n/locales/es_SV<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_hangul<br>
=C2=A0/usr/share/i18n/locales/es_HN<br>
=C2=A0/usr/share/i18n/locales/bo_CN<br>
=C2=A0/usr/share/i18n/locales/trans<wbr>lit_fraction<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>160.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>5427-EXT.gz<br>
=C2=A0/usr/share/i18n/charmaps/SHIF<wbr>T_JISX0213.gz<br>
=C2=A0/usr/share/i18n/charmaps/CSA_<wbr>Z243.4-1985-GR.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>646.IRV.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>97.gz<br>
=C2=A0/usr/share/i18n/charmaps/VISC<wbr>II.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP12<wbr>57.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>6937-2-25.gz<br>
=C2=A0/usr/share/i18n/charmaps/DEC-<wbr>MCS.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP73<wbr>7.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>71.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-US.gz<br>
=C2=A0/usr/share/i18n/charmaps/MAC-<wbr>IS.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>78.gz<br>
=C2=A0/usr/share/i18n/charmaps/MAC-<wbr>SAMI.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-8.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP10<wbr>007.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-FI-SE-A.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>62.gz<br>
=C2=A0/usr/share/i18n/charmaps/HP-T<wbr>HAI8.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>129.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>IR-209.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>65.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM9<wbr>18.gz<br>
=C2=A0/usr/share/i18n/charmaps/GBK.<wbr>gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM9<wbr>05.gz<br>
=C2=A0/usr/share/i18n/charmaps/DS_2<wbr>089.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-DK-NO-A.gz<br>
=C2=A0/usr/share/i18n/charmaps/MAC-<wbr>CENTRALEUROPE.gz<br>
=C2=A0/usr/share/i18n/charmaps/JOHA<wbr>B.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>KOI8-T.gz<br>
=C2=A0/usr/share/i18n/charmaps/MIK.<wbr>gz<br>
=C2=A0/usr/share/i18n/charmaps/JIS_<wbr>C6229-1984-HAND-ADD.gz<br>
=C2=A0/usr/share/i18n/charmaps/GEOR<wbr>GIAN-ACADEMY.gz<br>
=C2=A0/usr/share/i18n/charmaps/EUC-<wbr>TW.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>NATS-DANO-ADD.gz<br>
=C2=A0/usr/share/i18n/charmaps/NS_4<wbr>551-2.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>BIG5.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-IS-FRISS.gz<br>
=C2=A0/usr/share/i18n/charmaps/KOI-<wbr>8.gz<br>
=C2=A0/usr/share/i18n/charmaps/T.<wbr>61-7BIT.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-15.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>IR-197.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-PT.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>63.gz<br>
=C2=A0/usr/share/i18n/charmaps/BS_V<wbr>IEWDATA.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>52.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-13.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>90.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-ES-A.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>75.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>8859-SUPP.gz<br>
=C2=A0/usr/share/i18n/charmaps/JIS_<wbr>C6229-1984-A.gz<br>
=C2=A0/usr/share/i18n/charmaps/MACI<wbr>NTOSH.gz<br>
=C2=A0/usr/share/i18n/charmaps/HP-G<wbr>REEK8.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>8859-1,GL.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>INIS-8.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-AT-DE-A.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>ECMA-CYRILLIC.gz<br>
=C2=A0/usr/share/i18n/charmaps/JIS_<wbr>C6220-1969-RO.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-FR.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>124.gz<br>
=C2=A0/usr/share/i18n/charmaps/BS_4<wbr>730.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM9<wbr>22.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>80.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>66.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM9<wbr>03.gz<br>
=C2=A0/usr/share/i18n/charmaps/MAC-<wbr>CYRILLIC.gz<br>
=C2=A0/usr/share/i18n/charmaps/EUC-<wbr>JP-MS.gz<br>
=C2=A0/usr/share/i18n/charmaps/DIN_<wbr>66003.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP11<wbr>25.gz<br>
=C2=A0/usr/share/i18n/charmaps/HP-R<wbr>OMAN9.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-ES.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>ANSI_X3.4-1968.gz<br>
=C2=A0/usr/share/i18n/charmaps/EUC-<wbr>JISX0213.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP12<wbr>58.gz<br>
=C2=A0/usr/share/i18n/charmaps/NEXT<wbr>STEP.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>NATS-DANO.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>KOI8-U.gz<br>
=C2=A0/usr/share/i18n/charmaps/GREE<wbr>K7-OLD.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-10.gz<br>
=C2=A0/usr/share/i18n/charmaps/VIDE<wbr>OTEX-SUPPL.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-AT-DE.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP12<wbr>53.gz<br>
=C2=A0/usr/share/i18n/charmaps/CSN_<wbr>369103.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP77<wbr>1.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP77<wbr>5.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>91.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP12<wbr>51.gz<br>
=C2=A0/usr/share/i18n/charmaps/NF_<wbr>Z_62-010_1973.gz<br>
=C2=A0/usr/share/i18n/charmaps/EUC-<wbr>JP.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>INIS.gz<br>
=C2=A0/usr/share/i18n/charmaps/JUS_<wbr>I.B1.002.gz<br>
=C2=A0/usr/share/i18n/charmaps/JIS_<wbr>X0201.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>74.gz<br>
=C2=A0/usr/share/i18n/charmaps/HP-T<wbr>URKISH8.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-1.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>61.gz<br>
=C2=A0/usr/share/i18n/charmaps/JUS_<wbr>I.B1.003-SERB.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>68.gz<br>
=C2=A0/usr/share/i18n/charmaps/SEN_<wbr>850200_B.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>50.gz<br>
=C2=A0/usr/share/i18n/charmaps/GB_1<wbr>988-80.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>ASMO_449.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP12<wbr>54.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-DK-NO.gz<br>
=C2=A0/usr/share/i18n/charmaps/BRF.<wbr>gz<br>
=C2=A0/usr/share/i18n/charmaps/NF_<wbr>Z_62-010.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>6937.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>NATS-SEFI.gz<br>
=C2=A0/usr/share/i18n/charmaps/PT15<wbr>4.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-11.gz<br>
=C2=A0/usr/share/i18n/charmaps/ARMS<wbr>CII-8.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-9.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM0<wbr>37.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-9E.gz<br>
=C2=A0/usr/share/i18n/charmaps/LATI<wbr>N-GREEK-1.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-6.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>047.gz<br>
=C2=A0/usr/share/i18n/charmaps/NS_4<wbr>551-1.gz<br>
=C2=A0/usr/share/i18n/charmaps/T.<wbr>61-8BIT.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>80.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>51.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP12<wbr>56.gz<br>
=C2=A0/usr/share/i18n/charmaps/JIS_<wbr>C6220-1969-JP.gz<br>
=C2=A0/usr/share/i18n/charmaps/ES.<wbr>gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>75.gz<br>
=C2=A0/usr/share/i18n/charmaps/T.10<wbr>1-G2.gz<br>
=C2=A0/usr/share/i18n/charmaps/NC_N<wbr>C00-10.gz<br>
=C2=A0/usr/share/i18n/charmaps/ES2.<wbr>gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>85.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM4<wbr>24.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>646.BASIC.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>2033-1983.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP77<wbr>3.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>69.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>57.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>56.gz<br>
=C2=A0/usr/share/i18n/charmaps/EUC-<wbr>KR.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>SAMI-WS2.gz<br>
=C2=A0/usr/share/i18n/charmaps/IT.<wbr>gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>IR-90.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>004.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>INIS-CYRILLIC.gz<br>
=C2=A0/usr/share/i18n/charmaps/MSZ_<wbr>7795.3.gz<br>
=C2=A0/usr/share/i18n/charmaps/HP-R<wbr>OMAN8.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM5<wbr>00.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-4.gz<br>
=C2=A0/usr/share/i18n/charmaps/JIS_<wbr>C6229-1984-KANA.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM4<wbr>20.gz<br>
=C2=A0/usr/share/i18n/charmaps/GREE<wbr>K7.gz<br>
=C2=A0/usr/share/i18n/charmaps/SHIF<wbr>T_JIS.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP12<wbr>50.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP12<wbr>55.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>NATS-SEFI-ADD.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>66NAV.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM4<wbr>37.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-14.gz<br>
=C2=A0/usr/share/i18n/charmaps/GEOR<wbr>GIAN-PS.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>70.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM0<wbr>38.gz<br>
=C2=A0/usr/share/i18n/charmaps/WIND<wbr>OWS-31J.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>55.gz<br>
=C2=A0/usr/share/i18n/charmaps/CWI.<wbr>gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>026.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>64.gz<br>
=C2=A0/usr/share/i18n/charmaps/PT.<wbr>gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-CA-FR.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP94<wbr>9.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP12<wbr>52.gz<br>
=C2=A0/usr/share/i18n/charmaps/GREE<wbr>K-CCITT.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>6937-2-ADD.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP77<wbr>2.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>60.gz<br>
=C2=A0/usr/share/i18n/charmaps/JIS_<wbr>C6229-1984-HAND.gz<br>
=C2=A0/usr/share/i18n/charmaps/UTF-<wbr>8.gz<br>
=C2=A0/usr/share/i18n/charmaps/CSA_<wbr>Z243.4-1985-1.gz<br>
=C2=A0/usr/share/i18n/charmaps/CSA_<wbr>Z243.4-1985-2.gz<br>
=C2=A0/usr/share/i18n/charmaps/JIS_<wbr>C6229-1984-B.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>73.gz<br>
=C2=A0/usr/share/i18n/charmaps/TCVN<wbr>5712-1.gz<br>
=C2=A0/usr/share/i18n/charmaps/GB23<wbr>12.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>5427.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>84.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>KOI8-RU.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>10646.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-5.gz<br>
=C2=A0/usr/share/i18n/charmaps/GB18<wbr>030.gz<br>
=C2=A0/usr/share/i18n/charmaps/JUS_<wbr>I.B1.003-MAC.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>77.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>10367-BOX.gz<br>
=C2=A0/usr/share/i18n/charmaps/SEN_<wbr>850200_C.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-3.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM9<wbr>04.gz<br>
=C2=A0/usr/share/i18n/charmaps/TIS-<wbr>620.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>132.gz<br>
=C2=A0/usr/share/i18n/charmaps/TSCI<wbr>I.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM2<wbr>81.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-IT.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>133.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>ANSI_X3.110-1983.gz<br>
=C2=A0/usr/share/i18n/charmaps/JIS_<wbr>C6229-1984-B-ADD.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>163.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP77<wbr>0.gz<br>
=C2=A0/usr/share/i18n/charmaps/CP77<wbr>4.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>164.gz<br>
=C2=A0/usr/share/i18n/charmaps/RK10<wbr>48.gz<br>
=C2=A0/usr/share/i18n/charmaps/INVA<wbr>RIANT.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>GOST_19768-74.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-16.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>74.gz<br>
=C2=A0/usr/share/i18n/charmaps/LATI<wbr>N-GREEK.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM4<wbr>23.gz<br>
=C2=A0/usr/share/i18n/charmaps/KSC5<wbr>636.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>BIG5-HKSCS.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>11548-1.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-FI-SE.gz<br>
=C2=A0/usr/share/i18n/charmaps/MAC-<wbr>UK.gz<br>
=C2=A0/usr/share/i18n/charmaps/PT2.<wbr>gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-2.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO-<wbr>8859-7.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM8<wbr>56.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-UK.gz<br>
=C2=A0/usr/share/i18n/charmaps/EBCD<wbr>IC-ES-S.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>161.gz<br>
=C2=A0/usr/share/i18n/charmaps/IBM1<wbr>162.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>KOI8-R.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISO_<wbr>5428.gz<br>
=C2=A0/usr/share/i18n/charmaps/<wbr>SAMI.gz<br>
=C2=A0/usr/share/i18n/charmaps/IEC_<wbr>P27-1.gz<br>
=C2=A0/usr/share/i18n/charmaps/ISIR<wbr>I-3342.gz<br>
=C2=A0/usr/lib/gconv/CP770.so<br>
=C2=A0/usr/lib/gconv/ISO-2022-CN-EX<wbr>T.so<br>
=C2=A0/usr/lib/gconv/UTF-32.so<br>
=C2=A0/usr/lib/gconv/IBM870.so<br>
=C2=A0/usr/lib/gconv/IBM1390.so<br>
=C2=A0/usr/lib/gconv/CP1254.so<br>
=C2=A0/usr/lib/gconv/ISO8859-8.so<br>
=C2=A0/usr/lib/gconv/IBM1137.so<br>
=C2=A0/usr/lib/gconv/CP1258.so<br>
=C2=A0/usr/lib/gconv/SHIFT_<wbr>JISX0213.so<br>
=C2=A0/usr/lib/gconv/IBM905.so<br>
=C2=A0/usr/lib/gconv/IBM281.so<br>
=C2=A0/usr/lib/gconv/IBM1025.so<br>
=C2=A0/usr/lib/gconv/ISO-2022-KR.so<br>
=C2=A0/usr/lib/gconv/IBM921.so<br>
=C2=A0/usr/lib/gconv/ISO8859-9E.so<br>
=C2=A0/usr/lib/gconv/IBM1147.so<br>
=C2=A0/usr/lib/gconv/libKSC.so<br>
=C2=A0/usr/lib/gconv/IBM1388.so<br>
=C2=A0/usr/lib/gconv/IBM4909.so<br>
=C2=A0/usr/lib/gconv/UHC.so<br>
=C2=A0/usr/lib/gconv/HP-THAI8.so<br>
=C2=A0/usr/lib/gconv/MACINTOSH.so<br>
=C2=A0/usr/lib/gconv/IBM1008.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-US.so<br>
=C2=A0/usr/lib/gconv/GOST_19768-74.<wbr>so<br>
=C2=A0/usr/lib/gconv/libCNS.so<br>
=C2=A0/usr/lib/gconv/IBM932.so<br>
=C2=A0/usr/lib/gconv/IBM437.so<br>
=C2=A0/usr/lib/gconv/IBM943.so<br>
=C2=A0/usr/lib/gconv/TSCII.so<br>
=C2=A0/usr/lib/gconv/IBM277.so<br>
=C2=A0/usr/lib/gconv/DEC-MCS.so<br>
=C2=A0/usr/lib/gconv/IBM866.so<br>
=C2=A0/usr/lib/gconv/ARMSCII-8.so<br>
=C2=A0/usr/lib/gconv/HP-ROMAN8.so<br>
=C2=A0/usr/lib/gconv/IBM1148.so<br>
=C2=A0/usr/lib/gconv/VISCII.so<br>
=C2=A0/usr/lib/gconv/ISO_5427-EXT.<wbr>so<br>
=C2=A0/usr/lib/gconv/IBM1371.so<br>
=C2=A0/usr/lib/gconv/ISO8859-7.so<br>
=C2=A0/usr/lib/gconv/ISO8859-14.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-DK-NO-<wbr>A.so<br>
=C2=A0/usr/lib/gconv/IBM9030.so<br>
=C2=A0/usr/lib/gconv/IBM937.so<br>
=C2=A0/usr/lib/gconv/IBM851.so<br>
=C2=A0/usr/lib/gconv/MAC-CENTRALEUR<wbr>OPE.so<br>
=C2=A0/usr/lib/gconv/IBM857.so<br>
=C2=A0/usr/lib/gconv/ISO-2022-JP.so<br>
=C2=A0/usr/lib/gconv/SJIS.so<br>
=C2=A0/usr/lib/gconv/KOI-8.so<br>
=C2=A0/usr/lib/gconv/IBM935.so<br>
=C2=A0/usr/lib/gconv/IBM278.so<br>
=C2=A0/usr/lib/gconv/IBM9066.so<br>
=C2=A0/usr/lib/gconv/LATIN-GREEK-1.<wbr>so<br>
=C2=A0/usr/lib/gconv/ISO_2033.so<br>
=C2=A0/usr/lib/gconv/NATS-SEFI.so<br>
=C2=A0/usr/lib/gconv/ISO_6937-2.so<br>
=C2=A0/usr/lib/gconv/ISO_5428.so<br>
=C2=A0/usr/lib/gconv/IBM285.so<br>
=C2=A0/usr/lib/gconv/libJIS.so<br>
=C2=A0/usr/lib/gconv/ISO_10367-BOX.<wbr>so<br>
=C2=A0/usr/lib/gconv/IBM1122.so<br>
=C2=A0/usr/lib/gconv/EUC-JP-MS.so<br>
=C2=A0/usr/lib/gconv/IBM420.so<br>
=C2=A0/usr/lib/gconv/IBM424.so<br>
=C2=A0/usr/lib/gconv/IBM1141.so<br>
=C2=A0/usr/lib/gconv/CWI.so<br>
=C2=A0/usr/lib/gconv/EUC-TW.so<br>
=C2=A0/usr/lib/gconv/IBM1130.so<br>
=C2=A0/usr/lib/gconv/IBM891.so<br>
=C2=A0/usr/lib/gconv/HP-ROMAN9.so<br>
=C2=A0/usr/lib/gconv/IBM297.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-CA-FR.<wbr>so<br>
=C2=A0/usr/lib/gconv/CP772.so<br>
=C2=A0/usr/lib/gconv/INIS-8.so<br>
=C2=A0/usr/lib/gconv/IBM038.so<br>
=C2=A0/usr/lib/gconv/CP1253.so<br>
=C2=A0/usr/lib/gconv/BIG5.so<br>
=C2=A0/usr/lib/gconv/SAMI-WS2.so<br>
=C2=A0/usr/lib/gconv/IBM1161.so<br>
=C2=A0/usr/lib/gconv/IBM1026.so<br>
=C2=A0/usr/lib/gconv/CP1256.so<br>
=C2=A0/usr/lib/gconv/HP-GREEK8.so<br>
=C2=A0/usr/lib/gconv/IBM1144.so<br>
=C2=A0/usr/lib/gconv/IBM1155.so<br>
=C2=A0/usr/lib/gconv/MIK.so<br>
=C2=A0/usr/lib/gconv/EUC-KR.so<br>
=C2=A0/usr/lib/gconv/KOI8-RU.so<br>
=C2=A0/usr/lib/gconv/gconv-modules<br>
=C2=A0/usr/lib/gconv/GEORGIAN-PS.so<br>
=C2=A0/usr/lib/gconv/libISOIR165.so<br>
=C2=A0/usr/lib/gconv/ISO8859-1.so<br>
=C2=A0/usr/lib/gconv/ISO_6937.so<br>
=C2=A0/usr/lib/gconv/INIS-CYRILLIC.<wbr>so<br>
=C2=A0/usr/lib/gconv/EBCDIC-AT-DE.<wbr>so<br>
=C2=A0/usr/lib/gconv/IBM1166.so<br>
=C2=A0/usr/lib/gconv/EUC-JP.so<br>
=C2=A0/usr/lib/gconv/IBM855.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-IT.so<br>
=C2=A0/usr/lib/gconv/ISO8859-5.so<br>
=C2=A0/usr/lib/gconv/IBM803.so<br>
=C2=A0/usr/lib/gconv/ISO-2022-CN.so<br>
=C2=A0/usr/lib/gconv/libGB.so<br>
=C2=A0/usr/lib/gconv/IBM1149.so<br>
=C2=A0/usr/lib/gconv/ISO-2022-JP-3.<wbr>so<br>
=C2=A0/usr/lib/gconv/EBCDIC-IS-FRIS<wbr>S.so<br>
=C2=A0/usr/lib/gconv/ASMO_449.so<br>
=C2=A0/usr/lib/gconv/IBM1143.so<br>
=C2=A0/usr/lib/gconv/IBM1164.so<br>
=C2=A0/usr/lib/gconv/IBM903.so<br>
=C2=A0/usr/lib/gconv/IEC_P27-1.so<br>
=C2=A0/usr/lib/gconv/IBM1364.so<br>
=C2=A0/usr/lib/gconv/ISO8859-4.so<br>
=C2=A0/usr/lib/gconv/CP773.so<br>
=C2=A0/usr/lib/gconv/ISIRI-3342.so<br>
=C2=A0/usr/lib/gconv/IBM862.so<br>
=C2=A0/usr/lib/gconv/GBK.so<br>
=C2=A0/usr/lib/gconv/GB18030.so<br>
=C2=A0/usr/lib/gconv/IBM256.so<br>
=C2=A0/usr/lib/gconv/CP774.so<br>
=C2=A0/usr/lib/gconv/IBM274.so<br>
=C2=A0/usr/lib/gconv/ISO646.so<br>
=C2=A0/usr/lib/gconv/IBM1047.so<br>
=C2=A0/usr/lib/gconv/GBBIG5.so<br>
=C2=A0/usr/lib/gconv/IBM1154.so<br>
=C2=A0/usr/lib/gconv/IBM930.so<br>
=C2=A0/usr/lib/gconv/ISO8859-16.so<br>
=C2=A0/usr/lib/gconv/PT154.so<br>
=C2=A0/usr/lib/gconv/IBM874.so<br>
=C2=A0/usr/lib/gconv/IBM1160.so<br>
=C2=A0/usr/lib/gconv/IBM869.so<br>
=C2=A0/usr/lib/gconv/IBM904.so<br>
=C2=A0/usr/lib/gconv/IBM863.so<br>
=C2=A0/usr/lib/gconv/CSN_369103.so<br>
=C2=A0/usr/lib/gconv/IBM852.so<br>
=C2=A0/usr/lib/gconv/IBM4899.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-ES.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-FR.so<br>
=C2=A0/usr/lib/gconv/IBM875.so<br>
=C2=A0/usr/lib/gconv/MAC-UK.so<br>
=C2=A0/usr/lib/gconv/IBM037.so<br>
=C2=A0/usr/lib/gconv/ISO8859-9.so<br>
=C2=A0/usr/lib/gconv/CP775.so<br>
=C2=A0/usr/lib/gconv/KOI8-U.so<br>
=C2=A0/usr/lib/gconv/CP737.so<br>
=C2=A0/usr/lib/gconv/libJISX0213.so<br>
=C2=A0/usr/lib/gconv/IBM864.so<br>
=C2=A0/usr/lib/gconv/UTF-7.so<br>
=C2=A0/usr/lib/gconv/ISO-IR-197.so<br>
=C2=A0/usr/lib/gconv/IBM939.so<br>
=C2=A0/usr/lib/gconv/IBM1112.so<br>
=C2=A0/usr/lib/gconv/IBM861.so<br>
=C2=A0/usr/lib/gconv/IBM866NAV.so<br>
=C2=A0/usr/lib/gconv/IBM1097.so<br>
=C2=A0/usr/lib/gconv/CP1125.so<br>
=C2=A0/usr/lib/gconv/INIS.so<br>
=C2=A0/usr/lib/gconv/TIS-620.so<br>
=C2=A0/usr/lib/gconv/IBM868.so<br>
=C2=A0/usr/lib/gconv/CP1250.so<br>
=C2=A0/usr/lib/gconv/CP1252.so<br>
=C2=A0/usr/lib/gconv/IBM871.so<br>
=C2=A0/usr/lib/gconv/IBM273.so<br>
=C2=A0/usr/lib/gconv/IBM1004.so<br>
=C2=A0/usr/lib/gconv/TCVN5712-1.so<br>
=C2=A0/usr/lib/gconv/ISO8859-3.so<br>
=C2=A0/usr/lib/gconv/IBM4971.so<br>
=C2=A0/usr/lib/gconv/CP1255.so<br>
=C2=A0/usr/lib/gconv/IBM902.so<br>
=C2=A0/usr/lib/gconv/IBM1123.so<br>
=C2=A0/usr/lib/gconv/IBM284.so<br>
=C2=A0/usr/lib/gconv/IBM850.so<br>
=C2=A0/usr/lib/gconv/GEORGIAN-ACADE<wbr>MY.so<br>
=C2=A0/usr/lib/gconv/IBM5347.so<br>
=C2=A0/usr/lib/gconv/<a href=3D"http://ANSI_X3.110.so" rel=3D"noreferrer" t=
arget=3D"_blank">ANSI_X3.110.so</a><br>
=C2=A0/usr/lib/gconv/GREEK7-OLD.so<br>
=C2=A0/usr/lib/gconv/IBM290.so<br>
=C2=A0/usr/lib/gconv/LATIN-GREEK.so<br>
=C2=A0/usr/lib/gconv/IBM12712.so<br>
=C2=A0/usr/lib/gconv/KOI8-R.so<br>
=C2=A0/usr/lib/gconv/ISO-IR-209.so<br>
=C2=A0/usr/lib/gconv/IBM1129.so<br>
=C2=A0/usr/lib/gconv/KOI8-T.so<br>
=C2=A0/usr/lib/gconv/ECMA-CYRILLIC.<wbr>so<br>
=C2=A0/usr/lib/gconv/IBM933.so<br>
=C2=A0/usr/lib/gconv/NATS-DANO.so<br>
=C2=A0/usr/lib/gconv/IBM1158.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-FI-SE-<wbr>A.so<br>
=C2=A0/usr/lib/gconv/GREEK7.so<br>
=C2=A0/usr/lib/gconv/CP1257.so<br>
=C2=A0/usr/lib/gconv/IBM865.so<br>
=C2=A0/usr/lib/gconv/MAC-IS.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-FI-SE.<wbr>so<br>
=C2=A0/usr/lib/gconv/IBM16804.so<br>
=C2=A0/usr/lib/gconv/GBGBK.so<br>
=C2=A0/usr/lib/gconv/IBM1167.so<br>
=C2=A0/usr/lib/gconv/ISO8859-6.so<br>
=C2=A0/usr/lib/gconv/<a href=3D"http://T.61.so" rel=3D"noreferrer" target=
=3D"_blank">T.61.so</a><br>
=C2=A0/usr/lib/gconv/EBCDIC-AT-DE-<wbr>A.so<br>
=C2=A0/usr/lib/gconv/HP-TURKISH8.so<br>
=C2=A0/usr/lib/gconv/UNICODE.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-ES-S.so<br>
=C2=A0/usr/lib/gconv/JOHAB.so<br>
=C2=A0/usr/lib/gconv/IBM4517.so<br>
=C2=A0/usr/lib/gconv/EUC-CN.so<br>
=C2=A0/usr/lib/gconv/IBM901.so<br>
=C2=A0/usr/lib/gconv/ISO8859-10.so<br>
=C2=A0/usr/lib/gconv/IBM1132.so<br>
=C2=A0/usr/lib/gconv/IBM1140.so<br>
=C2=A0/usr/lib/gconv/IBM1146.so<br>
=C2=A0/usr/lib/gconv/ISO_11548-1.so<br>
=C2=A0/usr/lib/gconv/IBM1133.so<br>
=C2=A0/usr/lib/gconv/IBM1046.so<br>
=C2=A0/usr/lib/gconv/IBM922.so<br>
=C2=A0/usr/lib/gconv/IBM918.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-PT.so<br>
=C2=A0/usr/lib/gconv/ISO8859-11.so<br>
=C2=A0/usr/lib/gconv/IBM1162.so<br>
=C2=A0/usr/lib/gconv/EUC-JISX0213.<wbr>so<br>
=C2=A0/usr/lib/gconv/IBM1153.so<br>
=C2=A0/usr/lib/gconv/IBM1145.so<br>
=C2=A0/usr/lib/gconv/IBM860.so<br>
=C2=A0/usr/lib/gconv/IBM1157.so<br>
=C2=A0/usr/lib/gconv/IBM880.so<br>
=C2=A0/usr/lib/gconv/UTF-16.so<br>
=C2=A0/usr/lib/gconv/CP1251.so<br>
=C2=A0/usr/lib/gconv/IBM1156.so<br>
=C2=A0/usr/lib/gconv/ISO_5427.so<br>
=C2=A0/usr/lib/gconv/CP932.so<br>
=C2=A0/usr/lib/gconv/BRF.so<br>
=C2=A0/usr/lib/gconv/IBM1399.so<br>
=C2=A0/usr/lib/gconv/IBM856.so<br>
=C2=A0/usr/lib/gconv/RK1048.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-ES-A.so<br>
=C2=A0/usr/lib/gconv/ISO8859-2.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-DK-NO.<wbr>so<br>
=C2=A0/usr/lib/gconv/IBM280.so<br>
=C2=A0/usr/lib/gconv/IBM423.so<br>
=C2=A0/usr/lib/gconv/IBM1163.so<br>
=C2=A0/usr/lib/gconv/BIG5HKSCS.so<br>
=C2=A0/usr/lib/gconv/EBCDIC-UK.so<br>
=C2=A0/usr/lib/gconv/ISO8859-15.so<br>
=C2=A0/usr/lib/gconv/GREEK-CCITT.so<br>
=C2=A0/usr/lib/gconv/CP771.so<br>
=C2=A0/usr/lib/gconv/ISO8859-13.so<br>
=C2=A0/usr/lib/gconv/IBM275.so<br>
=C2=A0/usr/lib/gconv/IBM1142.so<br>
=C2=A0/usr/lib/gconv/IBM9448.so<br>
=C2=A0/usr/lib/gconv/MAC-SAMI.so<br>
=C2=A0/usr/lib/gconv/IBM500.so<br>
=C2=A0/usr/lib/gconv/IBM1124.so<br>
=C2=A0/usr/lib/gconv/IBM1008_420.so<br>
=C2=A0/usr/lib/gconv/CP10007.so<br>
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.<br>
glibc-locale: 820 installed and not shipped files. [installed-vs-shipped]<b=
r>
ERROR: glibc-locale-2.24-r0 do_package: Fatal QA errors found, failing task=
.<br>
ERROR: glibc-locale-2.24-r0 do_package: Function failed: do_package<br>
ERROR: Logfile of failure stored in: /mnt/dude/yocto/poky/build/tmp<wbr>/wo=
rk/core2-64-poky-linux/glib<wbr>c-locale/2.24-r0/temp/log.do_<wbr>package.2=
1254<br>
ERROR: Task (/mnt/dude/yocto/poky/meta/rec<wbr>ipes-core/glibc/glibc-locale=
_<wbr>2.24.bb:do_package) failed with exit code &#39;1&#39;<br>
Waiting for 4 running tasks to finish:<br>
0: linux-yocto-4.8.3+gitAUTOINC+8<wbr>3110d94ed_1adf9d3633-r0 do_compile_ke=
rnelmodules - 249s (pid 21240)<br>
1: openssl-1.0.2j-r0 do_compile - 126s (pid 9144)<br>
2: ncurses-6.0+20160625-r0 do_configure - 90s (pid 14798)<br>
3: expat-2.2.0-r0 do_configure - 21s (pid 23842)<br>
<br>
</div></div><div class=3D"m_5183960328307139582HOEnZb"><div class=3D"m_5183=
960328307139582h5">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"m_5183960328307139582gmail_signature" data-smartmail=3D"gmail_signature=
">&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;</div>
</div></div>

--001a114750b0c8a91d054157fefb--
