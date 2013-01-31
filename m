Return-Path: <Lei.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BD8EE006CC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Jan 2013 23:07:18 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0V77BHe012314
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Jan 2013 23:07:11 -0800 (PST)
Received: from [128.224.158.249] (128.224.158.249) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 30 Jan 2013 23:07:09 -0800
Message-ID: <510A1818.7080402@windriver.com>
Date: Thu, 31 Jan 2013 15:07:04 +0800
From: lei yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <1358910962-6960-1-git-send-email-lei.yang@windriver.com>
	<70CC66F5C30A414DADDA6973E4CA391A866F23@039-SN1MPN1-002.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A866F23@039-SN1MPN1-002.039d.mgd.msft.net>
X-Originating-IP: [128.224.158.249]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] This package provides: - multipath: scans the system for multipathed devices, assembles - multipathd: waits for maps events then execs multipath - kpartx: maps linear devmaps to device partitions, which makes multipath...
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
X-List-Received-Date: Thu, 31 Jan 2013 07:07:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/31/2013 03:04 PM, McClintock Matthew-B29882 wrote:
> On Tue, Jan 22, 2013 at 9:16 PM,  <lei.yang@windriver.com> wrote:
>> From: Lei Yang <lei.yang@windriver.com>
>>
>> Now,It can be used for kvm disk img partion mounting for me.
> Looks like the first subject line is way to long.... ;)

Yes, I have resent

Lei



> -M
>
>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>> ---
>>   .../multipath-tools/multipath-tools_git.bb         |   46 ++++++++++++++++++++
>>   1 files changed, 46 insertions(+), 0 deletions(-)
>>   create mode 100644 recipes-extended/multipath-tools/multipath-tools_git.bb
>>
>> diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb b/recipes-extended/multipath-tools/multipath-tools_git.bb
>> new file mode 100644
>> index 0000000..633b9f2
>> --- /dev/null
>> +++ b/recipes-extended/multipath-tools/multipath-tools_git.bb
>> @@ -0,0 +1,46 @@
>> +SUMMARY = "Tools to Manage Multipathed Devices with the device-mapper"
>> +DESCRIPTION = "This package provides the tools to manage multipathed devices by \
>> +instructing the device-mapper multipath module what to do"
>> +
>> +HOMEPAGE = "http://christophe.varoqui.free.fr/"
>> +DEPENDS = "readline libaio lvm2"
>> +LICENSE = "GPLv2"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
>> +S="${WORKDIR}/git"
>> +
>> +
>> +SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
>> +
>> +SRCREV = "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
>> +PV = "0.4.9+gitr${SRCPV}"
>> +
>> +inherit autotools
>> +
>> +EXTRA_OEMAKE="LIB=${libdir} exec_prefix=${exec_prefix} libdir=${libdir}"
>> +
>> +PACKAGES =+ "libmpathpersist mpathpersist kpartx libmultipath multipath multipathd libmultipath-dev libmpathpersist-dev"
>> +
>> +
>> +RDEPENDS_${PN} += "libmpathpersist mpathpersist kpartx libmultipath multipath multipathd udev"
>> +
>> +do_install_append () {
>> +       ln -sf libmpathpersist.so.0 ${D}${libdir}/libmpathpersist.so
>> +       ln -sf libmultipath.so.0 ${D}${libdir}/libmultipath.so
>> +}
>> +
>> +ALLOW_EMPTY_${PN} = "1"
>> +FILES_${PN}     = ""
>> +
>> +FILES_libmpathpersist = "${libdir}/libmpathpersist*.so.0"
>> +FILES_mpathpersist = "${sbindir}/mpathpersist"
>> +FILES_kpartx = "${sbindir}/kpartx ${base_libdir}/udev/"
>> +FILES_libmultipath = "${libdir}/libcheck*.so ${libdir}/libpri*.so ${libdir}/libmultipath*.so.0"
>> +FILES_multipath = "${sbindir}/multipath ${sysconfdir}"
>> +FILES_multipathd = "${sbindir}/multipathd ${base_libdir}"
>> +
>> +#put the symbol link lib in -dev
>> +FILES_libmultipath-dev = "${libdir}/libmultipath*.so"
>> +FILES_libmpathpersist-dev = "${libdir}/libmpathpersist*.so"
>> +
>> +
>> --
>> 1.7.1
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization


