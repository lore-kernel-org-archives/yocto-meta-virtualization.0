Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30456E00C2B; Tue, 25 Jul 2017 00:38:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86746E00C25
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 00:38:12 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6P7cBYd023684
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 00:38:11 -0700
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 25 Jul 2017 00:38:03 -0700
To: <mark.asselstine@windriver.com>
References: <1500873264-24606-1-git-send-email-yi.zhao@windriver.com>
	<1500873264-24606-2-git-send-email-yi.zhao@windriver.com>
	<CAPuovEKujQt1p+5+03X30p0NVQSOUxh1RXtAi+pjdywZZsgA1Q@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <b5250488-6970-f6f8-3cbf-5666313b5fd9@windriver.com>
Date: Tue, 25 Jul 2017 15:38:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAPuovEKujQt1p+5+03X30p0NVQSOUxh1RXtAi+pjdywZZsgA1Q@mail.gmail.com>
X-Originating-IP: [128.224.162.198]
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH 1/3] libibverbs: add new recpie
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
X-List-Received-Date: Tue, 25 Jul 2017 07:38:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2017年07月25日 03:29, Mark Asselstine 写道:
> On Mon, Jul 24, 2017 at 1:14 AM, Yi Zhao <yi.zhao@windriver.com> wrote:
>> Libibverbs is a library that allows userspace processes to use
>> InfiniBand/RDMA 'verbs' directly.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   recipes-extended/libibverbs/libibverbs_1.1.7.bb | 27 +++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>   create mode 100644 recipes-extended/libibverbs/libibverbs_1.1.7.bb
>>
>> diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
>> new file mode 100644
>> index 0000000..e75f90d
>> --- /dev/null
>> +++ b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
>> @@ -0,0 +1,27 @@
>> +SUMMARY = "Support InfiniBand verbs"
>> +DESCRIPTION = "Libibverbs is a library that allows userspace processes to use InfiniBand/RDMA 'verbs' directly."
>> +HOMEPAGE = "http://www.openfabrics.org/downloads/verbs/"
> I am fine with this series overall. It is nice to see an uprev to
> gluster and an effort to get it working again. I only have one
> request. The page above basically indicates that software which used
> libibverbs should transition to rdma_core and that this software is
> basically deprecated. Are we using this instead of rdma_core because
> Gluster has yet to make this transition? We need to capture whatever
> the reasons are in the commit log.

I checked the commit log for glusterfs, there is no explicit message 
said it only depend on old libibverbs.
For rdma-core, it is a collection including libibverbs and librdmacm. I 
did a quick test that glusterfs can be built when depending on it.
So maybe we could using rdma-core instead of libibverbs and librdmacm ?

Regards,
Yi

>
> Regards,
> Mark
>
>> +SECTION = "libs/devel"
>> +
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=7c557f27dd795ba77cc419dddc656b51"
>> +
>> +# Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git
>> +SRC_URI = "http://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "5aea59e4766ae4548419010ac84032ff"
>> +SRC_URI[sha256sum] = "31b4114bf32d41c9fc81a862ec5febed1e982975f21fa177ea9c7516c9064690"
>> +
>> +inherit autotools
>> +
>> +PACKAGES += "${PN}-utils"
>> +FILES_${PN} = "${sysconfdir} ${libdir}/*.so.*"
>> +FILES_${PN}-utils = "${bindir}"
>> +
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"
>> +
>> +do_install_append() {
>> +        mkdir -p ${D}${sysconfdir}/libibverbs.d
>> +        rm -f ${D}${libdir}/libibverbs.la
>> +}
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization


