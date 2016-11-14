Return-Path: <andrew.stuart@supercoders.com.au>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87F67E00B47; Mon, 14 Nov 2016 01:02:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.supercoders.com.au (mail.supercoders.com.au [54.215.13.78])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D19CE00A1A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Nov 2016 01:02:29 -0800 (PST)
Received: from [192.168.1.126] (unknown [101.167.6.11])
	by mail.supercoders.com.au (Postfix) with ESMTPS id B809660844;
	Mon, 14 Nov 2016 09:02:28 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Andrew Stuart <andrew.stuart@supercoders.com.au>
In-Reply-To: <CADkTA4PE=-S4AV59jE8Ui0Djnz-wgpWphE+GkXe3RwCZO+qGwQ@mail.gmail.com>
Date: Mon, 14 Nov 2016 20:02:26 +1100
Message-Id: <08A8F9CF-BDC9-4CCB-ABD1-12CABA0C4FD9@supercoders.com.au>
References: <689434D1-C433-4938-9F84-8F24C30093F6@supercoders.com.au>
	<CADkTA4PE=-S4AV59jE8Ui0Djnz-wgpWphE+GkXe3RwCZO+qGwQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.3124)
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
X-List-Received-Date: Mon, 14 Nov 2016 09:02:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

thanks Bruce - your help is much appreciated.

>> What branch are you building (of poky/oe-core and of meta-virt) ? It =
really shouldn=E2=80=99t matter, but it can be relevant .. so best to =
ask right away.

I=E2=80=99m not sure the answer to that.  How would I know which branch =
I=E2=80=99m building?

>>Also have you put 'xen' in your DISTRO_FEATURES ? (it can be done in =
your local.conf). Those kernel configs are only added/enabled when xen =
is found in the distro config.

When I do:=20
bitbake xen-guest-image-minimal

It builds fine.

I then add DISTRO_FEATURES=3D=E2=80=9Cxen=E2=80=9D to the end of my =
conf/local.conf and do exactly the same thing (bitbake =
xen-guest-image-minimal)

Which results in the following errors.  Any guesses?

thanks!


ubuntu@ugbuildserver:/mnt/dude/yocto/poky/build$ bitbake =
xen-guest-image-minimal
Parsing recipes: 100% =
|#########################################################################=
###################################################################| =
Time: 0:01:08
Parsing of 1903 .bb files complete (0 cached, 1903 parsed). 2597 =
targets, 351 skipped, 0 masked, 0 errors.
NOTE: There are 3 recipes to be removed from sysroot x86_64, removing...
NOTE: There are 1 recipes to be removed from sysroot allarch, =
removing...
NOTE: There are 24 recipes to be removed from sysroot core2-64, =
removing...
NOTE: There are 25 recipes to be removed from sysroot qemux86-64, =
removing...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.32.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "universal"
TARGET_SYS        =3D "x86_64-poky-linux"
MACHINE           =3D "qemux86-64"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "2.2"
TUNE_FEATURES     =3D "m64 core2"
TARGET_FPU        =3D ""
meta
meta-poky
meta-yocto-bsp
meta-webserver    =3D "morty:dc8508f609974cc99606b9042bfa7f870ce80228"
meta-virtualization =3D =
"master:011c4d611b3ce4e4922207ea0f58fd475eab83fb"
meta-networking
meta-oe
meta-python
meta-filesystems  =3D "morty:dc8508f609974cc99606b9042bfa7f870ce80228"

Initialising tasks: 100% =
|#########################################################################=
################################################################| Time: =
0:00:04
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: glibc-locale-2.24-r0 do_package: QA Issue: glibc-locale: =
Files/directories were installed but not shipped in any package:
  /usr/share/i18n
  /usr/share/i18n/locales
  /usr/share/i18n/charmaps
  /usr/share/i18n/locales/kw_GB
  /usr/share/i18n/locales/ug_CN
  /usr/share/i18n/locales/as_IN
  /usr/share/i18n/locales/sa_IN
  /usr/share/i18n/locales/mhr_RU
  /usr/share/i18n/locales/ml_IN
  /usr/share/i18n/locales/ak_GH
  /usr/share/i18n/locales/tg_TJ
  /usr/share/i18n/locales/translit_compat
  /usr/share/i18n/locales/fr_FR
  /usr/share/i18n/locales/sl_SI
  /usr/share/i18n/locales/xh_ZA
  /usr/share/i18n/locales/lv_LV
  /usr/share/i18n/locales/de_DE
  /usr/share/i18n/locales/bn_BD
  /usr/share/i18n/locales/so_DJ
  /usr/share/i18n/locales/ku_TR
  /usr/share/i18n/locales/es_AR
  /usr/share/i18n/locales/yi_US
  /usr/share/i18n/locales/pt_PT
  /usr/share/i18n/locales/it_IT@euro
  /usr/share/i18n/locales/st_ZA
  /usr/share/i18n/locales/translit_cjk_variants
  /usr/share/i18n/locales/en_HK
  /usr/share/i18n/locales/ga_IE@euro
  /usr/share/i18n/locales/ur_PK
  /usr/share/i18n/locales/tr_TR
  /usr/share/i18n/locales/aa_ER
  /usr/share/i18n/locales/nl_AW
  /usr/share/i18n/locales/tt_RU@iqtelif
  /usr/share/i18n/locales/es_CL
  /usr/share/i18n/locales/en_IE@euro
  /usr/share/i18n/locales/csb_PL
  /usr/share/i18n/locales/de_BE
  /usr/share/i18n/locales/br_FR
  /usr/share/i18n/locales/es_GT
  /usr/share/i18n/locales/lg_UG
  /usr/share/i18n/locales/os_RU
  /usr/share/i18n/locales/uz_UZ
  /usr/share/i18n/locales/de_BE@euro
  /usr/share/i18n/locales/mk_MK
  /usr/share/i18n/locales/nl_NL@euro
  /usr/share/i18n/locales/i18n
  /usr/share/i18n/locales/ka_GE
  /usr/share/i18n/locales/shs_CA
  /usr/share/i18n/locales/gu_IN
  /usr/share/i18n/locales/cs_CZ
  /usr/share/i18n/locales/pap_AW
  /usr/share/i18n/locales/ar_AE
  /usr/share/i18n/locales/gez_ET
  /usr/share/i18n/locales/ha_NG
  /usr/share/i18n/locales/nso_ZA
  /usr/share/i18n/locales/en_DK
  /usr/share/i18n/locales/sq_MK
  /usr/share/i18n/locales/en_CA
  /usr/share/i18n/locales/sr_ME
  /usr/share/i18n/locales/sgs_LT
  /usr/share/i18n/locales/fr_BE@euro
  /usr/share/i18n/locales/es_MX
  /usr/share/i18n/locales/en_NZ
  /usr/share/i18n/locales/ga_IE
  /usr/share/i18n/locales/ar_IN
  /usr/share/i18n/locales/pap_CW
  /usr/share/i18n/locales/ru_RU
  /usr/share/i18n/locales/es_US
  /usr/share/i18n/locales/es_PY
  /usr/share/i18n/locales/nl_NL
  /usr/share/i18n/locales/es_ES
  /usr/share/i18n/locales/en_IN
  /usr/share/i18n/locales/pl_PL
  /usr/share/i18n/locales/sq_AL
  /usr/share/i18n/locales/ca_ES
  /usr/share/i18n/locales/zh_CN
  /usr/share/i18n/locales/ks_IN@devanagari
  /usr/share/i18n/locales/gez_ER@abegede
  /usr/share/i18n/locales/de_LI
  /usr/share/i18n/locales/fil_PH
  /usr/share/i18n/locales/pa_IN
  /usr/share/i18n/locales/ig_NG
  /usr/share/i18n/locales/brx_IN
  /usr/share/i18n/locales/is_IS
  /usr/share/i18n/locales/en_AU
  /usr/share/i18n/locales/gez_ER
  /usr/share/i18n/locales/bem_ZM
  /usr/share/i18n/locales/sr_RS@latin
  /usr/share/i18n/locales/mr_IN
  /usr/share/i18n/locales/ca_AD
  /usr/share/i18n/locales/ro_RO
  /usr/share/i18n/locales/kk_KZ
  /usr/share/i18n/locales/te_IN
  /usr/share/i18n/locales/en_ZW
  /usr/share/i18n/locales/dv_MV
  /usr/share/i18n/locales/az_AZ
  /usr/share/i18n/locales/aa_ET
  /usr/share/i18n/locales/es_CU
  /usr/share/i18n/locales/id_ID
  /usr/share/i18n/locales/wal_ET
  /usr/share/i18n/locales/bho_IN
  /usr/share/i18n/locales/es_BO
  /usr/share/i18n/locales/hak_TW
  /usr/share/i18n/locales/ru_UA
  /usr/share/i18n/locales/zu_ZA
  /usr/share/i18n/locales/uz_UZ@cyrillic
  /usr/share/i18n/locales/be_BY@latin
  /usr/share/i18n/locales/be_BY
  /usr/share/i18n/locales/ca_FR
  /usr/share/i18n/locales/it_CH
  /usr/share/i18n/locales/sd_IN@devanagari
  /usr/share/i18n/locales/sid_ET
  /usr/share/i18n/locales/de_AT@euro
  /usr/share/i18n/locales/tt_RU
  /usr/share/i18n/locales/hi_IN
  /usr/share/i18n/locales/ar_YE
  /usr/share/i18n/locales/POSIX
  /usr/share/i18n/locales/ne_NP
  /usr/share/i18n/locales/sc_IT
  /usr/share/i18n/locales/am_ET
  /usr/share/i18n/locales/fi_FI
  /usr/share/i18n/locales/fr_LU@euro
  /usr/share/i18n/locales/km_KH
  /usr/share/i18n/locales/niu_NU
  /usr/share/i18n/locales/chr_US
  /usr/share/i18n/locales/tr_CY
  /usr/share/i18n/locales/nl_BE@euro
  /usr/share/i18n/locales/ar_SD
  /usr/share/i18n/locales/ber_MA
  /usr/share/i18n/locales/yo_NG
  /usr/share/i18n/locales/en_IE
  /usr/share/i18n/locales/translit_narrow
  /usr/share/i18n/locales/ss_ZA
  /usr/share/i18n/locales/cmn_TW
  /usr/share/i18n/locales/translit_wide
  /usr/share/i18n/locales/om_ET
  /usr/share/i18n/locales/af_ZA
  /usr/share/i18n/locales/byn_ER
  /usr/share/i18n/locales/ik_CA
  /usr/share/i18n/locales/fy_DE
  /usr/share/i18n/locales/tk_TM
  /usr/share/i18n/locales/kn_IN
  /usr/share/i18n/locales/niu_NZ
  /usr/share/i18n/locales/gl_ES
  /usr/share/i18n/locales/or_IN
  /usr/share/i18n/locales/eo
  /usr/share/i18n/locales/tcy_IN
  /usr/share/i18n/locales/ar_SS
  /usr/share/i18n/locales/ca_IT
  /usr/share/i18n/locales/nan_TW@latin
  /usr/share/i18n/locales/es_PA
  /usr/share/i18n/locales/ti_ET
  /usr/share/i18n/locales/oc_FR
  /usr/share/i18n/locales/wa_BE@euro
  /usr/share/i18n/locales/th_TH
  /usr/share/i18n/locales/en_GB
  /usr/share/i18n/locales/ayc_PE
  /usr/share/i18n/locales/translit_cjk_compat
  /usr/share/i18n/locales/br_FR@euro
  /usr/share/i18n/locales/mg_MG
  /usr/share/i18n/locales/cy_GB
  /usr/share/i18n/locales/fo_FO
  /usr/share/i18n/locales/ar_TN
  /usr/share/i18n/locales/translit_circle
  /usr/share/i18n/locales/szl_PL
  /usr/share/i18n/locales/fr_LU
  /usr/share/i18n/locales/ar_LB
  /usr/share/i18n/locales/sv_FI@euro
  /usr/share/i18n/locales/mn_MN
  /usr/share/i18n/locales/fur_IT
  /usr/share/i18n/locales/zh_HK
  /usr/share/i18n/locales/ks_IN
  /usr/share/i18n/locales/ar_DZ
  /usr/share/i18n/locales/so_ET
  /usr/share/i18n/locales/ja_JP
  /usr/share/i18n/locales/ta_LK
  /usr/share/i18n/locales/el_GR
  /usr/share/i18n/locales/sat_IN
  /usr/share/i18n/locales/uk_UA
  /usr/share/i18n/locales/es_UY
  /usr/share/i18n/locales/kl_GL
  /usr/share/i18n/locales/sv_FI
  /usr/share/i18n/locales/translit_small
  /usr/share/i18n/locales/ky_KG
  /usr/share/i18n/locales/doi_IN
  /usr/share/i18n/locales/hy_AM
  /usr/share/i18n/locales/se_NO
  /usr/share/i18n/locales/quz_PE
  /usr/share/i18n/locales/wae_CH
  /usr/share/i18n/locales/raj_IN
  /usr/share/i18n/locales/sv_SE
  /usr/share/i18n/locales/el_GR@euro
  /usr/share/i18n/locales/tig_ER
  /usr/share/i18n/locales/en_PH
  /usr/share/i18n/locales/fr_BE
  /usr/share/i18n/locales/de_CH
  /usr/share/i18n/locales/tn_ZA
  /usr/share/i18n/locales/en_US
  /usr/share/i18n/locales/iso14651_t1_pinyin
  /usr/share/i18n/locales/es_VE
  /usr/share/i18n/locales/de_LU
  /usr/share/i18n/locales/ln_CD
  /usr/share/i18n/locales/translit_font
  /usr/share/i18n/locales/ts_ZA
  /usr/share/i18n/locales/fy_NL
  /usr/share/i18n/locales/ce_RU
  /usr/share/i18n/locales/an_ES
  /usr/share/i18n/locales/es_NI
  /usr/share/i18n/locales/ar_SY
  /usr/share/i18n/locales/es_PR
  /usr/share/i18n/locales/nhn_MX
  /usr/share/i18n/locales/gez_ET@abegede
  /usr/share/i18n/locales/hr_HR
  /usr/share/i18n/locales/ia_FR
  /usr/share/i18n/locales/bg_BG
  /usr/share/i18n/locales/sw_KE
  /usr/share/i18n/locales/ko_KR
  /usr/share/i18n/locales/mni_IN
  /usr/share/i18n/locales/anp_IN
  /usr/share/i18n/locales/hne_IN
  /usr/share/i18n/locales/bs_BA
  /usr/share/i18n/locales/li_BE
  /usr/share/i18n/locales/ar_LY
  /usr/share/i18n/locales/mag_IN
  /usr/share/i18n/locales/en_ZM
  /usr/share/i18n/locales/eu_ES@euro
  /usr/share/i18n/locales/da_DK
  /usr/share/i18n/locales/ar_IQ
  /usr/share/i18n/locales/de_LU@euro
  /usr/share/i18n/locales/ti_ER
  /usr/share/i18n/locales/iso14651_t1
  /usr/share/i18n/locales/ca_ES@euro
  /usr/share/i18n/locales/de_DE@euro
  /usr/share/i18n/locales/fr_CA
  /usr/share/i18n/locales/zh_TW
  /usr/share/i18n/locales/fr_FR@euro
  /usr/share/i18n/locales/si_LK
  /usr/share/i18n/locales/bo_IN
  /usr/share/i18n/locales/el_CY
  /usr/share/i18n/locales/crh_UA
  /usr/share/i18n/locales/nds_DE
  /usr/share/i18n/locales/sk_SK
  /usr/share/i18n/locales/yue_HK
  /usr/share/i18n/locales/cv_RU
  /usr/share/i18n/locales/my_MM
  /usr/share/i18n/locales/sr_RS
  /usr/share/i18n/locales/hsb_DE
  /usr/share/i18n/locales/lb_LU
  /usr/share/i18n/locales/en_SG
  /usr/share/i18n/locales/ber_DZ
  /usr/share/i18n/locales/iso14651_t1_common
  /usr/share/i18n/locales/ar_KW
  /usr/share/i18n/locales/dz_BT
  /usr/share/i18n/locales/en_AG
  /usr/share/i18n/locales/so_SO
  /usr/share/i18n/locales/fr_CH
  /usr/share/i18n/locales/eu_ES
  /usr/share/i18n/locales/aa_DJ
  /usr/share/i18n/locales/bn_IN
  /usr/share/i18n/locales/es_EC
  /usr/share/i18n/locales/lo_LA
  /usr/share/i18n/locales/mi_NZ
  /usr/share/i18n/locales/lij_IT
  /usr/share/i18n/locales/pt_BR
  /usr/share/i18n/locales/om_KE
  /usr/share/i18n/locales/mt_MT
  /usr/share/i18n/locales/wa_BE
  /usr/share/i18n/locales/vi_VN
  /usr/share/i18n/locales/ve_ZA
  /usr/share/i18n/locales/de_IT
  /usr/share/i18n/locales/en_BW
  /usr/share/i18n/locales/translit_combining
  /usr/share/i18n/locales/es_CR
  /usr/share/i18n/locales/sd_IN
  /usr/share/i18n/locales/en_ZA
  /usr/share/i18n/locales/de_AT
  /usr/share/i18n/locales/aa_ER@saaho
  /usr/share/i18n/locales/es_PE
  /usr/share/i18n/locales/lzh_TW
  /usr/share/i18n/locales/ta_IN
  /usr/share/i18n/locales/es_CO
  /usr/share/i18n/locales/nl_BE
  /usr/share/i18n/locales/nn_NO
  /usr/share/i18n/locales/ar_OM
  /usr/share/i18n/locales/ar_EG
  /usr/share/i18n/locales/ar_SA
  /usr/share/i18n/locales/ff_SN
  /usr/share/i18n/locales/ar_BH
  /usr/share/i18n/locales/es_DO
  /usr/share/i18n/locales/wo_SN
  /usr/share/i18n/locales/pt_PT@euro
  /usr/share/i18n/locales/the_NP
  /usr/share/i18n/locales/hu_HU
  /usr/share/i18n/locales/nr_ZA
  /usr/share/i18n/locales/kok_IN
  /usr/share/i18n/locales/en_IL
  /usr/share/i18n/locales/translit_neutral
  /usr/share/i18n/locales/fi_FI@euro
  /usr/share/i18n/locales/pa_PK
  /usr/share/i18n/locales/ur_IN
  /usr/share/i18n/locales/et_EE
  /usr/share/i18n/locales/ps_AF
  /usr/share/i18n/locales/fa_IR
  /usr/share/i18n/locales/rw_RW
  /usr/share/i18n/locales/it_IT
  /usr/share/i18n/locales/he_IL
  /usr/share/i18n/locales/gl_ES@euro
  /usr/share/i18n/locales/ht_HT
  /usr/share/i18n/locales/ar_QA
  /usr/share/i18n/locales/ar_MA
  /usr/share/i18n/locales/nb_NO
  /usr/share/i18n/locales/es_ES@euro
  /usr/share/i18n/locales/en_NG
  /usr/share/i18n/locales/li_NL
  /usr/share/i18n/locales/tl_PH
  /usr/share/i18n/locales/nds_NL
  /usr/share/i18n/locales/bhb_IN
  /usr/share/i18n/locales/mai_IN
  /usr/share/i18n/locales/gd_GB
  /usr/share/i18n/locales/zh_SG
  /usr/share/i18n/locales/unm_US
  /usr/share/i18n/locales/ar_JO
  /usr/share/i18n/locales/gv_GB
  /usr/share/i18n/locales/ast_ES
  /usr/share/i18n/locales/so_KE
  /usr/share/i18n/locales/nan_TW
  /usr/share/i18n/locales/ms_MY
  /usr/share/i18n/locales/iu_CA
  /usr/share/i18n/locales/lt_LT
  /usr/share/i18n/locales/sw_TZ
  /usr/share/i18n/locales/es_SV
  /usr/share/i18n/locales/translit_hangul
  /usr/share/i18n/locales/es_HN
  /usr/share/i18n/locales/bo_CN
  /usr/share/i18n/locales/translit_fraction
  /usr/share/i18n/charmaps/IBM1160.gz
  /usr/share/i18n/charmaps/ISO_5427-EXT.gz
  /usr/share/i18n/charmaps/SHIFT_JISX0213.gz
  /usr/share/i18n/charmaps/CSA_Z243.4-1985-GR.gz
  /usr/share/i18n/charmaps/ISO_646.IRV.gz
  /usr/share/i18n/charmaps/IBM297.gz
  /usr/share/i18n/charmaps/VISCII.gz
  /usr/share/i18n/charmaps/CP1257.gz
  /usr/share/i18n/charmaps/ISO_6937-2-25.gz
  /usr/share/i18n/charmaps/DEC-MCS.gz
  /usr/share/i18n/charmaps/CP737.gz
  /usr/share/i18n/charmaps/IBM871.gz
  /usr/share/i18n/charmaps/EBCDIC-US.gz
  /usr/share/i18n/charmaps/MAC-IS.gz
  /usr/share/i18n/charmaps/IBM278.gz
  /usr/share/i18n/charmaps/MAC-SAMI.gz
  /usr/share/i18n/charmaps/ISO-8859-8.gz
  /usr/share/i18n/charmaps/CP10007.gz
  /usr/share/i18n/charmaps/EBCDIC-FI-SE-A.gz
  /usr/share/i18n/charmaps/IBM862.gz
  /usr/share/i18n/charmaps/HP-THAI8.gz
  /usr/share/i18n/charmaps/IBM1129.gz
  /usr/share/i18n/charmaps/ISO-IR-209.gz
  /usr/share/i18n/charmaps/IBM865.gz
  /usr/share/i18n/charmaps/IBM918.gz
  /usr/share/i18n/charmaps/GBK.gz
  /usr/share/i18n/charmaps/IBM905.gz
  /usr/share/i18n/charmaps/DS_2089.gz
  /usr/share/i18n/charmaps/EBCDIC-DK-NO-A.gz
  /usr/share/i18n/charmaps/MAC-CENTRALEUROPE.gz
  /usr/share/i18n/charmaps/JOHAB.gz
  /usr/share/i18n/charmaps/KOI8-T.gz
  /usr/share/i18n/charmaps/MIK.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-HAND-ADD.gz
  /usr/share/i18n/charmaps/GEORGIAN-ACADEMY.gz
  /usr/share/i18n/charmaps/EUC-TW.gz
  /usr/share/i18n/charmaps/NATS-DANO-ADD.gz
  /usr/share/i18n/charmaps/NS_4551-2.gz
  /usr/share/i18n/charmaps/BIG5.gz
  /usr/share/i18n/charmaps/EBCDIC-IS-FRISS.gz
  /usr/share/i18n/charmaps/KOI-8.gz
  /usr/share/i18n/charmaps/T.61-7BIT.gz
  /usr/share/i18n/charmaps/ISO-8859-15.gz
  /usr/share/i18n/charmaps/ISO-IR-197.gz
  /usr/share/i18n/charmaps/EBCDIC-PT.gz
  /usr/share/i18n/charmaps/IBM863.gz
  /usr/share/i18n/charmaps/BS_VIEWDATA.gz
  /usr/share/i18n/charmaps/IBM852.gz
  /usr/share/i18n/charmaps/ISO-8859-13.gz
  /usr/share/i18n/charmaps/IBM290.gz
  /usr/share/i18n/charmaps/EBCDIC-ES-A.gz
  /usr/share/i18n/charmaps/IBM275.gz
  /usr/share/i18n/charmaps/ISO_8859-SUPP.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-A.gz
  /usr/share/i18n/charmaps/MACINTOSH.gz
  /usr/share/i18n/charmaps/HP-GREEK8.gz
  /usr/share/i18n/charmaps/ISO_8859-1,GL.gz
  /usr/share/i18n/charmaps/INIS-8.gz
  /usr/share/i18n/charmaps/EBCDIC-AT-DE-A.gz
  /usr/share/i18n/charmaps/ECMA-CYRILLIC.gz
  /usr/share/i18n/charmaps/JIS_C6220-1969-RO.gz
  /usr/share/i18n/charmaps/EBCDIC-FR.gz
  /usr/share/i18n/charmaps/IBM1124.gz
  /usr/share/i18n/charmaps/BS_4730.gz
  /usr/share/i18n/charmaps/IBM922.gz
  /usr/share/i18n/charmaps/IBM280.gz
  /usr/share/i18n/charmaps/IBM866.gz
  /usr/share/i18n/charmaps/IBM903.gz
  /usr/share/i18n/charmaps/MAC-CYRILLIC.gz
  /usr/share/i18n/charmaps/EUC-JP-MS.gz
  /usr/share/i18n/charmaps/DIN_66003.gz
  /usr/share/i18n/charmaps/CP1125.gz
  /usr/share/i18n/charmaps/HP-ROMAN9.gz
  /usr/share/i18n/charmaps/EBCDIC-ES.gz
  /usr/share/i18n/charmaps/ANSI_X3.4-1968.gz
  /usr/share/i18n/charmaps/EUC-JISX0213.gz
  /usr/share/i18n/charmaps/CP1258.gz
  /usr/share/i18n/charmaps/NEXTSTEP.gz
  /usr/share/i18n/charmaps/NATS-DANO.gz
  /usr/share/i18n/charmaps/KOI8-U.gz
  /usr/share/i18n/charmaps/GREEK7-OLD.gz
  /usr/share/i18n/charmaps/ISO-8859-10.gz
  /usr/share/i18n/charmaps/VIDEOTEX-SUPPL.gz
  /usr/share/i18n/charmaps/EBCDIC-AT-DE.gz
  /usr/share/i18n/charmaps/CP1253.gz
  /usr/share/i18n/charmaps/CSN_369103.gz
  /usr/share/i18n/charmaps/CP771.gz
  /usr/share/i18n/charmaps/CP775.gz
  /usr/share/i18n/charmaps/IBM891.gz
  /usr/share/i18n/charmaps/CP1251.gz
  /usr/share/i18n/charmaps/NF_Z_62-010_1973.gz
  /usr/share/i18n/charmaps/EUC-JP.gz
  /usr/share/i18n/charmaps/INIS.gz
  /usr/share/i18n/charmaps/JUS_I.B1.002.gz
  /usr/share/i18n/charmaps/JIS_X0201.gz
  /usr/share/i18n/charmaps/IBM274.gz
  /usr/share/i18n/charmaps/HP-TURKISH8.gz
  /usr/share/i18n/charmaps/ISO-8859-1.gz
  /usr/share/i18n/charmaps/IBM861.gz
  /usr/share/i18n/charmaps/JUS_I.B1.003-SERB.gz
  /usr/share/i18n/charmaps/IBM868.gz
  /usr/share/i18n/charmaps/SEN_850200_B.gz
  /usr/share/i18n/charmaps/IBM850.gz
  /usr/share/i18n/charmaps/GB_1988-80.gz
  /usr/share/i18n/charmaps/ASMO_449.gz
  /usr/share/i18n/charmaps/CP1254.gz
  /usr/share/i18n/charmaps/EBCDIC-DK-NO.gz
  /usr/share/i18n/charmaps/BRF.gz
  /usr/share/i18n/charmaps/NF_Z_62-010.gz
  /usr/share/i18n/charmaps/ISO_6937.gz
  /usr/share/i18n/charmaps/NATS-SEFI.gz
  /usr/share/i18n/charmaps/PT154.gz
  /usr/share/i18n/charmaps/ISO-8859-11.gz
  /usr/share/i18n/charmaps/ARMSCII-8.gz
  /usr/share/i18n/charmaps/ISO-8859-9.gz
  /usr/share/i18n/charmaps/IBM037.gz
  /usr/share/i18n/charmaps/ISO-8859-9E.gz
  /usr/share/i18n/charmaps/LATIN-GREEK-1.gz
  /usr/share/i18n/charmaps/ISO-8859-6.gz
  /usr/share/i18n/charmaps/IBM1047.gz
  /usr/share/i18n/charmaps/NS_4551-1.gz
  /usr/share/i18n/charmaps/T.61-8BIT.gz
  /usr/share/i18n/charmaps/IBM880.gz
  /usr/share/i18n/charmaps/IBM851.gz
  /usr/share/i18n/charmaps/CP1256.gz
  /usr/share/i18n/charmaps/JIS_C6220-1969-JP.gz
  /usr/share/i18n/charmaps/ES.gz
  /usr/share/i18n/charmaps/IBM875.gz
  /usr/share/i18n/charmaps/T.101-G2.gz
  /usr/share/i18n/charmaps/NC_NC00-10.gz
  /usr/share/i18n/charmaps/ES2.gz
  /usr/share/i18n/charmaps/IBM285.gz
  /usr/share/i18n/charmaps/IBM424.gz
  /usr/share/i18n/charmaps/ISO_646.BASIC.gz
  /usr/share/i18n/charmaps/ISO_2033-1983.gz
  /usr/share/i18n/charmaps/CP773.gz
  /usr/share/i18n/charmaps/IBM869.gz
  /usr/share/i18n/charmaps/IBM857.gz
  /usr/share/i18n/charmaps/IBM256.gz
  /usr/share/i18n/charmaps/EUC-KR.gz
  /usr/share/i18n/charmaps/SAMI-WS2.gz
  /usr/share/i18n/charmaps/IT.gz
  /usr/share/i18n/charmaps/ISO-IR-90.gz
  /usr/share/i18n/charmaps/IBM1004.gz
  /usr/share/i18n/charmaps/INIS-CYRILLIC.gz
  /usr/share/i18n/charmaps/MSZ_7795.3.gz
  /usr/share/i18n/charmaps/HP-ROMAN8.gz
  /usr/share/i18n/charmaps/IBM500.gz
  /usr/share/i18n/charmaps/ISO-8859-4.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-KANA.gz
  /usr/share/i18n/charmaps/IBM420.gz
  /usr/share/i18n/charmaps/GREEK7.gz
  /usr/share/i18n/charmaps/SHIFT_JIS.gz
  /usr/share/i18n/charmaps/CP1250.gz
  /usr/share/i18n/charmaps/CP1255.gz
  /usr/share/i18n/charmaps/NATS-SEFI-ADD.gz
  /usr/share/i18n/charmaps/IBM866NAV.gz
  /usr/share/i18n/charmaps/IBM437.gz
  /usr/share/i18n/charmaps/ISO-8859-14.gz
  /usr/share/i18n/charmaps/GEORGIAN-PS.gz
  /usr/share/i18n/charmaps/IBM870.gz
  /usr/share/i18n/charmaps/IBM038.gz
  /usr/share/i18n/charmaps/WINDOWS-31J.gz
  /usr/share/i18n/charmaps/IBM855.gz
  /usr/share/i18n/charmaps/CWI.gz
  /usr/share/i18n/charmaps/IBM1026.gz
  /usr/share/i18n/charmaps/IBM864.gz
  /usr/share/i18n/charmaps/PT.gz
  /usr/share/i18n/charmaps/EBCDIC-CA-FR.gz
  /usr/share/i18n/charmaps/CP949.gz
  /usr/share/i18n/charmaps/CP1252.gz
  /usr/share/i18n/charmaps/GREEK-CCITT.gz
  /usr/share/i18n/charmaps/ISO_6937-2-ADD.gz
  /usr/share/i18n/charmaps/CP772.gz
  /usr/share/i18n/charmaps/IBM860.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-HAND.gz
  /usr/share/i18n/charmaps/UTF-8.gz
  /usr/share/i18n/charmaps/CSA_Z243.4-1985-1.gz
  /usr/share/i18n/charmaps/CSA_Z243.4-1985-2.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-B.gz
  /usr/share/i18n/charmaps/IBM273.gz
  /usr/share/i18n/charmaps/TCVN5712-1.gz
  /usr/share/i18n/charmaps/GB2312.gz
  /usr/share/i18n/charmaps/ISO_5427.gz
  /usr/share/i18n/charmaps/IBM284.gz
  /usr/share/i18n/charmaps/KOI8-RU.gz
  /usr/share/i18n/charmaps/ISO_10646.gz
  /usr/share/i18n/charmaps/ISO-8859-5.gz
  /usr/share/i18n/charmaps/GB18030.gz
  /usr/share/i18n/charmaps/JUS_I.B1.003-MAC.gz
  /usr/share/i18n/charmaps/IBM277.gz
  /usr/share/i18n/charmaps/ISO_10367-BOX.gz
  /usr/share/i18n/charmaps/SEN_850200_C.gz
  /usr/share/i18n/charmaps/ISO-8859-3.gz
  /usr/share/i18n/charmaps/IBM904.gz
  /usr/share/i18n/charmaps/TIS-620.gz
  /usr/share/i18n/charmaps/IBM1132.gz
  /usr/share/i18n/charmaps/TSCII.gz
  /usr/share/i18n/charmaps/IBM281.gz
  /usr/share/i18n/charmaps/EBCDIC-IT.gz
  /usr/share/i18n/charmaps/IBM1133.gz
  /usr/share/i18n/charmaps/ANSI_X3.110-1983.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-B-ADD.gz
  /usr/share/i18n/charmaps/IBM1163.gz
  /usr/share/i18n/charmaps/CP770.gz
  /usr/share/i18n/charmaps/CP774.gz
  /usr/share/i18n/charmaps/IBM1164.gz
  /usr/share/i18n/charmaps/RK1048.gz
  /usr/share/i18n/charmaps/INVARIANT.gz
  /usr/share/i18n/charmaps/GOST_19768-74.gz
  /usr/share/i18n/charmaps/ISO-8859-16.gz
  /usr/share/i18n/charmaps/IBM874.gz
  /usr/share/i18n/charmaps/LATIN-GREEK.gz
  /usr/share/i18n/charmaps/IBM423.gz
  /usr/share/i18n/charmaps/KSC5636.gz
  /usr/share/i18n/charmaps/BIG5-HKSCS.gz
  /usr/share/i18n/charmaps/ISO_11548-1.gz
  /usr/share/i18n/charmaps/EBCDIC-FI-SE.gz
  /usr/share/i18n/charmaps/MAC-UK.gz
  /usr/share/i18n/charmaps/PT2.gz
  /usr/share/i18n/charmaps/ISO-8859-2.gz
  /usr/share/i18n/charmaps/ISO-8859-7.gz
  /usr/share/i18n/charmaps/IBM856.gz
  /usr/share/i18n/charmaps/EBCDIC-UK.gz
  /usr/share/i18n/charmaps/EBCDIC-ES-S.gz
  /usr/share/i18n/charmaps/IBM1161.gz
  /usr/share/i18n/charmaps/IBM1162.gz
  /usr/share/i18n/charmaps/KOI8-R.gz
  /usr/share/i18n/charmaps/ISO_5428.gz
  /usr/share/i18n/charmaps/SAMI.gz
  /usr/share/i18n/charmaps/IEC_P27-1.gz
  /usr/share/i18n/charmaps/ISIRI-3342.gz
  /usr/lib/gconv/CP770.so
  /usr/lib/gconv/ISO-2022-CN-EXT.so
  /usr/lib/gconv/UTF-32.so
  /usr/lib/gconv/IBM870.so
  /usr/lib/gconv/IBM1390.so
  /usr/lib/gconv/CP1254.so
  /usr/lib/gconv/ISO8859-8.so
  /usr/lib/gconv/IBM1137.so
  /usr/lib/gconv/CP1258.so
  /usr/lib/gconv/SHIFT_JISX0213.so
  /usr/lib/gconv/IBM905.so
  /usr/lib/gconv/IBM281.so
  /usr/lib/gconv/IBM1025.so
  /usr/lib/gconv/ISO-2022-KR.so
  /usr/lib/gconv/IBM921.so
  /usr/lib/gconv/ISO8859-9E.so
  /usr/lib/gconv/IBM1147.so
  /usr/lib/gconv/libKSC.so
  /usr/lib/gconv/IBM1388.so
  /usr/lib/gconv/IBM4909.so
  /usr/lib/gconv/UHC.so
  /usr/lib/gconv/HP-THAI8.so
  /usr/lib/gconv/MACINTOSH.so
  /usr/lib/gconv/IBM1008.so
  /usr/lib/gconv/EBCDIC-US.so
  /usr/lib/gconv/GOST_19768-74.so
  /usr/lib/gconv/libCNS.so
  /usr/lib/gconv/IBM932.so
  /usr/lib/gconv/IBM437.so
  /usr/lib/gconv/IBM943.so
  /usr/lib/gconv/TSCII.so
  /usr/lib/gconv/IBM277.so
  /usr/lib/gconv/DEC-MCS.so
  /usr/lib/gconv/IBM866.so
  /usr/lib/gconv/ARMSCII-8.so
  /usr/lib/gconv/HP-ROMAN8.so
  /usr/lib/gconv/IBM1148.so
  /usr/lib/gconv/VISCII.so
  /usr/lib/gconv/ISO_5427-EXT.so
  /usr/lib/gconv/IBM1371.so
  /usr/lib/gconv/ISO8859-7.so
  /usr/lib/gconv/ISO8859-14.so
  /usr/lib/gconv/EBCDIC-DK-NO-A.so
  /usr/lib/gconv/IBM9030.so
  /usr/lib/gconv/IBM937.so
  /usr/lib/gconv/IBM851.so
  /usr/lib/gconv/MAC-CENTRALEUROPE.so
  /usr/lib/gconv/IBM857.so
  /usr/lib/gconv/ISO-2022-JP.so
  /usr/lib/gconv/SJIS.so
  /usr/lib/gconv/KOI-8.so
  /usr/lib/gconv/IBM935.so
  /usr/lib/gconv/IBM278.so
  /usr/lib/gconv/IBM9066.so
  /usr/lib/gconv/LATIN-GREEK-1.so
  /usr/lib/gconv/ISO_2033.so
  /usr/lib/gconv/NATS-SEFI.so
  /usr/lib/gconv/ISO_6937-2.so
  /usr/lib/gconv/ISO_5428.so
  /usr/lib/gconv/IBM285.so
  /usr/lib/gconv/libJIS.so
  /usr/lib/gconv/ISO_10367-BOX.so
  /usr/lib/gconv/IBM1122.so
  /usr/lib/gconv/EUC-JP-MS.so
  /usr/lib/gconv/IBM420.so
  /usr/lib/gconv/IBM424.so
  /usr/lib/gconv/IBM1141.so
  /usr/lib/gconv/CWI.so
  /usr/lib/gconv/EUC-TW.so
  /usr/lib/gconv/IBM1130.so
  /usr/lib/gconv/IBM891.so
  /usr/lib/gconv/HP-ROMAN9.so
  /usr/lib/gconv/IBM297.so
  /usr/lib/gconv/EBCDIC-CA-FR.so
  /usr/lib/gconv/CP772.so
  /usr/lib/gconv/INIS-8.so
  /usr/lib/gconv/IBM038.so
  /usr/lib/gconv/CP1253.so
  /usr/lib/gconv/BIG5.so
  /usr/lib/gconv/SAMI-WS2.so
  /usr/lib/gconv/IBM1161.so
  /usr/lib/gconv/IBM1026.so
  /usr/lib/gconv/CP1256.so
  /usr/lib/gconv/HP-GREEK8.so
  /usr/lib/gconv/IBM1144.so
  /usr/lib/gconv/IBM1155.so
  /usr/lib/gconv/MIK.so
  /usr/lib/gconv/EUC-KR.so
  /usr/lib/gconv/KOI8-RU.so
  /usr/lib/gconv/gconv-modules
  /usr/lib/gconv/GEORGIAN-PS.so
  /usr/lib/gconv/libISOIR165.so
  /usr/lib/gconv/ISO8859-1.so
  /usr/lib/gconv/ISO_6937.so
  /usr/lib/gconv/INIS-CYRILLIC.so
  /usr/lib/gconv/EBCDIC-AT-DE.so
  /usr/lib/gconv/IBM1166.so
  /usr/lib/gconv/EUC-JP.so
  /usr/lib/gconv/IBM855.so
  /usr/lib/gconv/EBCDIC-IT.so
  /usr/lib/gconv/ISO8859-5.so
  /usr/lib/gconv/IBM803.so
  /usr/lib/gconv/ISO-2022-CN.so
  /usr/lib/gconv/libGB.so
  /usr/lib/gconv/IBM1149.so
  /usr/lib/gconv/ISO-2022-JP-3.so
  /usr/lib/gconv/EBCDIC-IS-FRISS.so
  /usr/lib/gconv/ASMO_449.so
  /usr/lib/gconv/IBM1143.so
  /usr/lib/gconv/IBM1164.so
  /usr/lib/gconv/IBM903.so
  /usr/lib/gconv/IEC_P27-1.so
  /usr/lib/gconv/IBM1364.so
  /usr/lib/gconv/ISO8859-4.so
  /usr/lib/gconv/CP773.so
  /usr/lib/gconv/ISIRI-3342.so
  /usr/lib/gconv/IBM862.so
  /usr/lib/gconv/GBK.so
  /usr/lib/gconv/GB18030.so
  /usr/lib/gconv/IBM256.so
  /usr/lib/gconv/CP774.so
  /usr/lib/gconv/IBM274.so
  /usr/lib/gconv/ISO646.so
  /usr/lib/gconv/IBM1047.so
  /usr/lib/gconv/GBBIG5.so
  /usr/lib/gconv/IBM1154.so
  /usr/lib/gconv/IBM930.so
  /usr/lib/gconv/ISO8859-16.so
  /usr/lib/gconv/PT154.so
  /usr/lib/gconv/IBM874.so
  /usr/lib/gconv/IBM1160.so
  /usr/lib/gconv/IBM869.so
  /usr/lib/gconv/IBM904.so
  /usr/lib/gconv/IBM863.so
  /usr/lib/gconv/CSN_369103.so
  /usr/lib/gconv/IBM852.so
  /usr/lib/gconv/IBM4899.so
  /usr/lib/gconv/EBCDIC-ES.so
  /usr/lib/gconv/EBCDIC-FR.so
  /usr/lib/gconv/IBM875.so
  /usr/lib/gconv/MAC-UK.so
  /usr/lib/gconv/IBM037.so
  /usr/lib/gconv/ISO8859-9.so
  /usr/lib/gconv/CP775.so
  /usr/lib/gconv/KOI8-U.so
  /usr/lib/gconv/CP737.so
  /usr/lib/gconv/libJISX0213.so
  /usr/lib/gconv/IBM864.so
  /usr/lib/gconv/UTF-7.so
  /usr/lib/gconv/ISO-IR-197.so
  /usr/lib/gconv/IBM939.so
  /usr/lib/gconv/IBM1112.so
  /usr/lib/gconv/IBM861.so
  /usr/lib/gconv/IBM866NAV.so
  /usr/lib/gconv/IBM1097.so
  /usr/lib/gconv/CP1125.so
  /usr/lib/gconv/INIS.so
  /usr/lib/gconv/TIS-620.so
  /usr/lib/gconv/IBM868.so
  /usr/lib/gconv/CP1250.so
  /usr/lib/gconv/CP1252.so
  /usr/lib/gconv/IBM871.so
  /usr/lib/gconv/IBM273.so
  /usr/lib/gconv/IBM1004.so
  /usr/lib/gconv/TCVN5712-1.so
  /usr/lib/gconv/ISO8859-3.so
  /usr/lib/gconv/IBM4971.so
  /usr/lib/gconv/CP1255.so
  /usr/lib/gconv/IBM902.so
  /usr/lib/gconv/IBM1123.so
  /usr/lib/gconv/IBM284.so
  /usr/lib/gconv/IBM850.so
  /usr/lib/gconv/GEORGIAN-ACADEMY.so
  /usr/lib/gconv/IBM5347.so
  /usr/lib/gconv/ANSI_X3.110.so
  /usr/lib/gconv/GREEK7-OLD.so
  /usr/lib/gconv/IBM290.so
  /usr/lib/gconv/LATIN-GREEK.so
  /usr/lib/gconv/IBM12712.so
  /usr/lib/gconv/KOI8-R.so
  /usr/lib/gconv/ISO-IR-209.so
  /usr/lib/gconv/IBM1129.so
  /usr/lib/gconv/KOI8-T.so
  /usr/lib/gconv/ECMA-CYRILLIC.so
  /usr/lib/gconv/IBM933.so
  /usr/lib/gconv/NATS-DANO.so
  /usr/lib/gconv/IBM1158.so
  /usr/lib/gconv/EBCDIC-FI-SE-A.so
  /usr/lib/gconv/GREEK7.so
  /usr/lib/gconv/CP1257.so
  /usr/lib/gconv/IBM865.so
  /usr/lib/gconv/MAC-IS.so
  /usr/lib/gconv/EBCDIC-FI-SE.so
  /usr/lib/gconv/IBM16804.so
  /usr/lib/gconv/GBGBK.so
  /usr/lib/gconv/IBM1167.so
  /usr/lib/gconv/ISO8859-6.so
  /usr/lib/gconv/T.61.so
  /usr/lib/gconv/EBCDIC-AT-DE-A.so
  /usr/lib/gconv/HP-TURKISH8.so
  /usr/lib/gconv/UNICODE.so
  /usr/lib/gconv/EBCDIC-ES-S.so
  /usr/lib/gconv/JOHAB.so
  /usr/lib/gconv/IBM4517.so
  /usr/lib/gconv/EUC-CN.so
  /usr/lib/gconv/IBM901.so
  /usr/lib/gconv/ISO8859-10.so
  /usr/lib/gconv/IBM1132.so
  /usr/lib/gconv/IBM1140.so
  /usr/lib/gconv/IBM1146.so
  /usr/lib/gconv/ISO_11548-1.so
  /usr/lib/gconv/IBM1133.so
  /usr/lib/gconv/IBM1046.so
  /usr/lib/gconv/IBM922.so
  /usr/lib/gconv/IBM918.so
  /usr/lib/gconv/EBCDIC-PT.so
  /usr/lib/gconv/ISO8859-11.so
  /usr/lib/gconv/IBM1162.so
  /usr/lib/gconv/EUC-JISX0213.so
  /usr/lib/gconv/IBM1153.so
  /usr/lib/gconv/IBM1145.so
  /usr/lib/gconv/IBM860.so
  /usr/lib/gconv/IBM1157.so
  /usr/lib/gconv/IBM880.so
  /usr/lib/gconv/UTF-16.so
  /usr/lib/gconv/CP1251.so
  /usr/lib/gconv/IBM1156.so
  /usr/lib/gconv/ISO_5427.so
  /usr/lib/gconv/CP932.so
  /usr/lib/gconv/BRF.so
  /usr/lib/gconv/IBM1399.so
  /usr/lib/gconv/IBM856.so
  /usr/lib/gconv/RK1048.so
  /usr/lib/gconv/EBCDIC-ES-A.so
  /usr/lib/gconv/ISO8859-2.so
  /usr/lib/gconv/EBCDIC-DK-NO.so
  /usr/lib/gconv/IBM280.so
  /usr/lib/gconv/IBM423.so
  /usr/lib/gconv/IBM1163.so
  /usr/lib/gconv/BIG5HKSCS.so
  /usr/lib/gconv/EBCDIC-UK.so
  /usr/lib/gconv/ISO8859-15.so
  /usr/lib/gconv/GREEK-CCITT.so
  /usr/lib/gconv/CP771.so
  /usr/lib/gconv/ISO8859-13.so
  /usr/lib/gconv/IBM275.so
  /usr/lib/gconv/IBM1142.so
  /usr/lib/gconv/IBM9448.so
  /usr/lib/gconv/MAC-SAMI.so
  /usr/lib/gconv/IBM500.so
  /usr/lib/gconv/IBM1124.so
  /usr/lib/gconv/IBM1008_420.so
  /usr/lib/gconv/CP10007.so
Please set FILES such that these items are packaged. Alternatively if =
they are unneeded, avoid installing them or delete them within =
do_install.
glibc-locale: 820 installed and not shipped files. =
[installed-vs-shipped]
ERROR: glibc-locale-2.24-r0 do_package: Fatal QA errors found, failing =
task.
ERROR: glibc-locale-2.24-r0 do_package: Function failed: do_package
ERROR: Logfile of failure stored in: =
/mnt/dude/yocto/poky/build/tmp/work/core2-64-poky-linux/glibc-locale/2.24-=
r0/temp/log.do_package.21254
ERROR: Task =
(/mnt/dude/yocto/poky/meta/recipes-core/glibc/glibc-locale_2.24.bb:do_pack=
age) failed with exit code '1'
Waiting for 4 running tasks to finish:
0: linux-yocto-4.8.3+gitAUTOINC+83110d94ed_1adf9d3633-r0 =
do_compile_kernelmodules - 249s (pid 21240)
1: openssl-1.0.2j-r0 do_compile - 126s (pid 9144)
2: ncurses-6.0+20160625-r0 do_configure - 90s (pid 14798)
3: expat-2.2.0-r0 do_configure - 21s (pid 23842)


