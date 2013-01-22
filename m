Return-Path: <Lei.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2810E01495
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 02:22:47 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0MAMBkD019897
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jan 2013 02:22:12 -0800 (PST)
Received: from [128.224.158.225] (128.224.158.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 22 Jan 2013 02:22:11 -0800
Message-ID: <50FE684F.3000107@windriver.com>
Date: Tue, 22 Jan 2013 18:22:07 +0800
From: lei yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.nystrom@enea.com>
References: <1358762433-11853-1-git-send-email-lei.yang@windriver.com>
	<50FE5110.7090104@enea.com>
In-Reply-To: <50FE5110.7090104@enea.com>
X-Originating-IP: [128.224.158.225]
Cc: meta-virtualization@yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] multipath-tools: Add multipath-tools recipe
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
X-List-Received-Date: Tue, 22 Jan 2013 10:22:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 01/22/2013 04:42 PM, David Nyström wrote:
> On Mon 21 Jan 2013 11:00:33 AM CET, lei.yang@windriver.com wrote:
>> From: Lei Yang <lei.yang@windriver.com>
>>
>> This packages provides:
>> - multipath: scans the system for multipathed devices, assembles
>> - multipathd: waits for maps events then execs multipath
>> - kpartx: maps linear devmaps to device partitions, which makes
>> multipath maps partionable
>> ......
>>
>> Now,It can be used for kvm disk img partion for me.
>>
>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>> ---
>>   .../multipath-tools/multipath-tools_git.bb         |   46 
>> ++++++++++++++++++++
>>   1 files changed, 46 insertions(+), 0 deletions(-)
>>   create mode 100644 
>> meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>>
>> diff --git 
>> a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb 
>> b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>> new file mode 100644
>> index 0000000..e9509d3
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>> @@ -0,0 +1,46 @@
>> +SUMMARY = "Tools to Manage Multipathed Devices with the device-mapper"
>> +DESCRIPTION = "This package provides the tools to manage multipathed 
>> devices by \
>> +instructing the device-mapper multipath module what to do"
>> +
>> +HOMEPAGE = "http://christophe.varoqui.free.fr/"
>> +DEPENDS = "readline libaio lvm2"
>> +LICENSE = "GPLv2"
>> +
>> +LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
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
>> +EXTRA_OEMAKE="LIB=${libdir} exec_prefix=${exec_prefix} 
>> libdir=${libdir}"
>> +
>> +PACKAGES =+ "libmpathpersist mpathpersist kpartx libmultipath 
>> multipath multipathd libmultipath-dev libmpathpersist-dev"
>> +
>> +
>> +RDEPENDS_${PN} += "libmpathpersist mpathpersist kpartx libmultipath 
>> multipath multipathd"
>> +
>
> Is RDEPENDS on udev not mandatory ?
>

good catch, we can add it, it will create /dev/mapper/loop0p1 node, I 
give a log for it's kpart usage in my testing,It's pretty easy for image 
partition
because you don't need to know offset for partition

root@intel_5500_server:/# kpartx -l sdb.img
loop0p1 : 0 20480 /dev/loop0 2048
loop0p2 : 0 10240 /dev/loop0 22528
loop deleted : /dev/loop0
root@intel_5500_server:/# kpartx -a sdb.img
root@intel_5500_server:/# ls /dev/mapper/
control  loop0p1  loop0p2
root@intel_5500_server:/# ls /dev/mapper/loop0p1
/dev/mapper/loop0p1
root@intel_5500_server:/# mkfs.ext3 /dev/mapper/loop0p1
.....

root@intel_5500_server:/# mount /dev/mapper/loop0p1 /mnt
root@intel_5500_server:/# ls /mnt
lost+found



>> +do_install_append () {
>> +    ln -sf libmpathpersist.so.0 ${D}${libdir}/libmpathpersist.so
>> +    ln -sf libmultipath.so.0 ${D}${libdir}/libmultipath.so
>> +}
>> +
>> +ALLOW_EMPTY_${PN} = "1"
>> +FILES_${PN}     = ""
>> +
>> +FILES_libmpathpersist = "${libdir}/libmpathpersist*.so.0"
>> +FILES_mpathpersist = "${sbindir}/mpathpersist"
>> +FILES_kpartx = "${sbindir}/kpartx ${base_libdir}/udev/"
>> +FILES_libmultipath = "${libdir}/libcheck*.so ${libdir}/libpri*.so 
>> ${libdir}/libmultipath*.so.0"
>> +FILES_multipath = "${sbindir}/multipath ${sysconfdir}"
>> +FILES_multipathd = "${sbindir}/multipathd ${base_libdir}"
>> +
>> +#put the symbol link lib in -dev
>> +FILES_libmultipath-dev = "${libdir}/libmultipath*.so"
>> +FILES_libmpathpersist-dev = "${libdir}/libmpathpersist*.so"
>> +
>> +
>
> Whats the intended destination for this recipe ?

if meta-oe,  recipes-support
if meta-virtualization: recipes-extended


> If not accepted in meta-oe, We'll be happy to merge it in 
> meta-virtualization.
>

Glad to add in meta-virt

Lei

> Br,
> David


