Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FF71E00B5E; Mon,  8 Oct 2018 22:09:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4C79E00A86
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Oct 2018 22:09:01 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w99590lS024426
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Oct 2018 22:09:00 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 8 Oct 2018 22:09:00 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
	<CADkTA4Nhu=48Rbm0MO=j-qBQstZqXgFPgOe7qxe=beygV2wfCQ@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <4a493713-ab4a-7f5d-8a8b-90eb3434609c@windriver.com>
Date: Tue, 9 Oct 2018 13:08:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Nhu=48Rbm0MO=j-qBQstZqXgFPgOe7qxe=beygV2wfCQ@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker-distribution: fix do package qa warning[ldflags]
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
X-List-Received-Date: Tue, 09 Oct 2018 05:09:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/01/2018 09:15 AM, Bruce Ashfield wrote:
> The shortlog of this isn't quite right.
>
> You are not really fixing the QA warning, but are making sure that it
> is masked in some sort of multlib configuration ?
> That needs to be clarified in the shortlog.
>
> On Sat, Sep 29, 2018 at 11:17 PM <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix below warning:
>> do_package_qa: QA Issue: No GNU_HASH in the elf binary:
>> xxx/usr/sbin/registry' [ldflags]
> And the configuration explained here.
>
> Bruce

I will update the shortlog in next version.

//Sandy
>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   recipes-containers/docker-distribution/docker-distribution_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
>> index 7c7bce2..23d94c9 100644
>> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
>> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
>> @@ -58,7 +58,7 @@ do_install() {
>>   }
>>
>>   INSANE_SKIP_${PN} += "ldflags already-stripped"
>> -INSANE_SKIP_docker-registry += "ldflags already-stripped"
>> +INSANE_SKIP_${MLPREFIX}docker-registry += "ldflags already-stripped"
>>
>>   FILES_docker-registry = "${sbindir}/*"
>>   FILES_docker-registry += "${systemd_unitdir}/system/docker-registry.service"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


