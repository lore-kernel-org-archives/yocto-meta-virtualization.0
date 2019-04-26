Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6CB32E00CE5; Thu, 25 Apr 2019 18:23:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 323FBE00C14
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Apr 2019 18:23:54 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3Q1N1mB029387
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Apr 2019 18:23:27 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 25 Apr 2019 18:23:20 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20190417075133.84331-1-kai.kang@windriver.com>
	<CADkTA4M2_79fvZSOuDisnKhe69O1ehKJUs0Y0Gg9CAh0Z59U2w@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <2428bd7f-a088-b766-4590-8f91f19ebf8c@windriver.com>
Date: Fri, 26 Apr 2019 09:20:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4M2_79fvZSOuDisnKhe69O1ehKJUs0Y0Gg9CAh0Z59U2w@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] glusterfs/librdmacm: fix dependency issue with libibverbs
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
X-List-Received-Date: Fri, 26 Apr 2019 01:23:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/4/18 下午9:13, Bruce Ashfield wrote:
> On Wed, Apr 17, 2019 at 3:51 AM <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> glusterfs and librdmacm depend on libibverbs. But libibverbs has been
>> set imcompatible with mipsarch and arm. Update glusterfs and librdmacm
>> accordingly.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   recipes-extended/glusterfs/glusterfs.inc      | 3 +++
>>   recipes-extended/librdmacm/librdmacm_1.1.0.bb | 3 +++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
>> index 5843d7c6..3fc04ffb 100644
>> --- a/recipes-extended/glusterfs/glusterfs.inc
>> +++ b/recipes-extended/glusterfs/glusterfs.inc
>> @@ -51,6 +51,9 @@ EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
>>                  "
>>
>>   PACKAGECONFIG ??= "georeplication libibverbs"
>> +PACKAGECONFIG_remove_mipsarch = "libibverbs"
>> +PACKAGECONFIG_remove_arm = "libibverbs"
>> +
>>   PACKAGECONFIG[bd-xlator] = "--enable-bd-xlator,--disable-bd-xlator,lvm2,"
>>   PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
>>   PACKAGECONFIG[georeplication] = "--enable-georeplication,--disable-georeplication,,rsync"
>> diff --git a/recipes-extended/librdmacm/librdmacm_1.1.0.bb b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
>> index 30a0c943..edf92f01 100644
>> --- a/recipes-extended/librdmacm/librdmacm_1.1.0.bb
>> +++ b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
>> @@ -39,3 +39,6 @@ do_install_append() {
>>           rm -f ${D}${libdir}/librdmacm.la
>>           rm -f ${D}${libdir}/rsocket/librspreload.la
>>   }
>> +
>> +COMPATIBLE_HOST_mipsarch = "none"
>> +COMPATIBLE_HOST_arm = "none"
> This should be a separate commit. We shouldn't mix the default
> packageconfig change
> and the marking of librdmacm as incompatible with mips/arm into the same commit.

OK.


>
> In particular, since I'd like the error message you get if librdmacm
> is compiled for arm/mips
> to be logged in the commit where we make it incompatible.


Got it. Thanks.

Kai


>
> Bruce
>
>> --
>> 2.20.0
>>
>

-- 
Kai Kang


