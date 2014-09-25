Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3DC9E0086E; Thu, 25 Sep 2014 05:13:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.53 listed in list.dnswl.org]
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 585B2E0086A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Sep 2014 05:13:43 -0700 (PDT)
Received: by mail-la0-f53.google.com with SMTP id ge10so12221663lab.40
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Sep 2014 05:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Mu/iR5OWBBY44BBn2F5849YPJl2SdIymX0ROjlr2pT8=;
	b=rzYTsHkFgSA6Rhd+K304fAmvP+qU9Ksb8Xn1j+fGe5u2XGwRo7smvTFyNyOzo7mwCr
	k/1BRTye6E3x5TT4iw16PZC2msKk/Fs8vjtUHerXfll4k8fFTIJ/4Po4ICjN/oRjQmKb
	2xsoexsAIhlO+jZYb3D1YyBfcpPNWWeZKp5ij3BJ3Hc+cwBc2buPt7MFNjyNyKSBlK+A
	wGh8Ac6/R/htpNGrVLY/ub70bGhXKy6JHFHPnxUAfwDCB2WKTrMNPpPuSdoo8Dl8GUMo
	dH6SB1cWL0c2pOww3LJr60qxnPUVkBa2wUvYRe73ptTWAU4jhB6DUwp+RoDXKCPM7uKL
	eOmg==
MIME-Version: 1.0
X-Received: by 10.152.87.146 with SMTP id ay18mr199199lab.92.1411647221802;
	Thu, 25 Sep 2014 05:13:41 -0700 (PDT)
Received: by 10.112.44.234 with HTTP; Thu, 25 Sep 2014 05:13:41 -0700 (PDT)
In-Reply-To: <20140925103837.GA2163@iapetus.enea.se>
References: <1411633276-18572-1-git-send-email-r63875@freescale.com>
	<20140925103837.GA2163@iapetus.enea.se>
Date: Thu, 25 Sep 2014 08:13:41 -0400
Message-ID: <CADkTA4PCaqGQnbTHuO_a6LG64Qiagcy5xBjf+fZUM_+ykNoyYw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Olivia Yin <r63875@freescale.com>
Subject: Re: [PATCH] libvirt: uprev to v1.2.8
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
X-List-Received-Date: Thu, 25 Sep 2014 12:13:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 25, 2014 at 6:38 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> On Thu, Sep 25, 2014 at 04:21:16PM +0800, Olivia Yin wrote:
>> ---
>>  .../libvirt/{libvirt_1.2.4.bb => libvirt_1.2.8.bb}      | 17 +++--------------
>>  1 file changed, 3 insertions(+), 14 deletions(-)
>>  rename recipes-extended/libvirt/{libvirt_1.2.4.bb => libvirt_1.2.8.bb} (91%)
>>
>> diff --git a/recipes-extended/libvirt/libvirt_1.2.4.bb b/recipes-extended/libvirt/libvirt_1.2.8.bb
>> similarity index 91%
>> rename from recipes-extended/libvirt/libvirt_1.2.4.bb
>> rename to recipes-extended/libvirt/libvirt_1.2.8.bb
>> index 56b4d4b..cdcd54b 100644
>> --- a/recipes-extended/libvirt/libvirt_1.2.4.bb
>> +++ b/recipes-extended/libvirt/libvirt_1.2.8.bb
>> @@ -24,16 +24,12 @@ RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
>>  RCONFLICTS_${PN}_libvirtd = "connman"
>>
>>  SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>> -           file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
>>             file://libvirtd.sh \
>>             file://libvirtd.conf \
>> -           file://runptest.patch \
>> -           file://run-ptest \
>> -           file://tests-allow-separated-src-and-build-dirs.patch \
>>            "
>>
>> -SRC_URI[libvirt.md5sum] = "da7a9ca519df45a460659189fe0024e6"
>> -SRC_URI[libvirt.sha256sum] = "e43ac5f6b2baeafcd01777be03a897e636f8d48c0cdfb4c4cbb80d45faa9e875"
>> +SRC_URI[libvirt.md5sum] = "75114991290f7c8f01dd5223431b9c00"
>> +SRC_URI[libvirt.sha256sum] = "0049940b013ea5858b53d9b540c9df9cc3c8cb08750acfd96e9991a1f709e100"
>>
>>  inherit autotools gettext update-rc.d pkgconfig ptest
>>
>> @@ -68,10 +64,6 @@ ac_cv_path_LVS=/usr/sbin/lvs \
>>  ac_cv_path_PARTED=/usr/sbin/parted \
>>  ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
>>
>> -# Ensure that libvirt uses polkit rather than policykit, whether the host has
>> -# pkcheck installed or not, and ensure the path is correct per our config.
>> -CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
>> -
>>  # Some other possible paths we are not yet setting
>>  #ac_cv_path_RPCGEN=
>>  #ac_cv_path_XSLTPROC=
>> @@ -80,6 +72,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
>>  #ac_cv_path_EBTABLES_PATH=
>>  #ac_cv_path_PKG_CONFIG=
>>  #ac_cv_path_ac_pt_PKG_CONFIG
>> +#ac_cv_path_PKCHECK_PATH=
>>  #ac_cv_path_POLKIT_AUTH=
>>  #ac_cv_path_DTRACE=
>>  #ac_cv_path_ISCSIADM=
>> @@ -172,7 +165,6 @@ PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EB
>>  PACKAGECONFIG[python] = ",,python,"
>>  PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
>>  PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
>> -PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
>>  PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
>>
>>  # Enable the Python tool support
>> @@ -203,9 +195,6 @@ do_install_append() {
>>            >> ${D}${sysconfdir}/default/volatiles/99_libvirt
>>       echo "d root root 0755 ${localstatedir}/run/libvirt/qemu none" \
>>            >> ${D}${sysconfdir}/default/volatiles/99_libvirt
>> -
>> -     # Add hook support for libvirt
>> -     mkdir -p ${D}/etc/libvirt/hooks
>>  }
>>
>>  EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH}"
>
> Apart from the version upgrade, there are many things being removed from the
> recipe, like patches, ptests, numactl configuration.... could you explain a bit
> the purpose of the removal?

Agreed. In particular, I'd quite like to keep the hooks directory
creation and numactl.
So unless there's some sort of horrible error that I've never seen, we
wouldn't merge
this as-is.

Cheers,

Bruce

>
> Thank you,
>
> /Josep
>
>> --
>> 2.1.0.27.g96db324
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

