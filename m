Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27F8DE00B5E; Mon,  8 Oct 2018 21:54:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24490E00A86
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Oct 2018 21:54:21 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w994rQ3S014157
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Oct 2018 21:53:37 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 8 Oct 2018 21:53:16 -0700
To: "M. Asselstine" <asselsm@mcmaster.ca>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
References: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
	<1538277461-163634-3-git-send-email-changqing.li@windriver.com>
	<CADkTA4MVaJzEcerxbocVh8hqon96dYsSXf3sZ4tN-iaHoFETwg@mail.gmail.com>
	<CAPuovEJts1fzd1NLO+rZp+6cDMv+yGVe37w1C9puBM=vUC00Hg@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <70a222e5-779b-ce41-ffbb-c9a25e7e387e@windriver.com>
Date: Tue, 9 Oct 2018 12:53:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAPuovEJts1fzd1NLO+rZp+6cDMv+yGVe37w1C9puBM=vUC00Hg@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: fix package qa warning
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
X-List-Received-Date: Tue, 09 Oct 2018 04:54:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/03/2018 02:42 AM, M. Asselstine wrote:
> On Sun, Sep 30, 2018 at 9:23 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Sat, Sep 29, 2018 at 11:18 PM <changqing.li@windriver.com> wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> fix below warning:
>>> do_package_qa: QA Issue: ELF binary 'xxx/usr/bin/docker'
>>> has relocations in .text [textrel]
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>>   recipes-containers/docker/docker_git.bb            |  1 +
>>>   .../files/0001-fix-do_package_qa-error.patch       | 31 ++++++++++++++++++++++
>>>   2 files changed, 32 insertions(+)
>>>   create mode 100644 recipes-containers/docker/files/0001-fix-do_package_qa-error.patch
>>>
>>> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
>>> index 73e0120..1a8d1a6 100644
>>> --- a/recipes-containers/docker/docker_git.bb
>>> +++ b/recipes-containers/docker/docker_git.bb
>>> @@ -28,6 +28,7 @@ SRC_URI = "\
>>>          file://docker.init \
>>>          file://hi.Dockerfile \
>>>           file://0001-libnetwork-use-GO-instead-of-go.patch \
>>> +        file://0001-fix-do_package_qa-error.patch \
>>>          "
>>>
>>>   # Apache-2.0 for docker
>>> diff --git a/recipes-containers/docker/files/0001-fix-do_package_qa-error.patch b/recipes-containers/docker/files/0001-fix-do_package_qa-error.patch
>>> new file mode 100644
>>> index 0000000..79e71a5
>>> --- /dev/null
>>> +++ b/recipes-containers/docker/files/0001-fix-do_package_qa-error.patch
>>> @@ -0,0 +1,31 @@
>>> +From 56c865e2a7269d63f0780b4cd1ed6fdb18e3ff1b Mon Sep 17 00:00:00 2001
>>> +From: Changqing Li <changqing.li@windriver.com>
>>> +Date: Wed, 26 Sep 2018 17:41:59 +0800
>>> +Subject: [PATCH] fix do_package_qa error
>>> +
>>> +fix below error:
>>> +do_package_qa: QA Issue: ELF binary 'xxx/usr/bin/docker'
>>> +has relocations in .text [textrel]
>>> +
>>> +Upstream-Status: Inappropriate [oe-specific]
>>> +
>>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> +---
>>> + cli/scripts/build/dynbinary | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/cli/scripts/build/dynbinary b/cli/scripts/build/dynbinary
>>> +index 3c32ed3..938e086 100755
>>> +--- a/cli/scripts/build/dynbinary
>>> ++++ b/cli/scripts/build/dynbinary
>>> +@@ -9,6 +9,6 @@ source ./scripts/build/.variables
>>> +
>>> + echo "Building dynamically linked $TARGET"
>>> + export CGO_ENABLED=1
>>> +-go build -o "${TARGET}" -tags pkcs11 --ldflags "${LDFLAGS}" "${SOURCE}"
>>> ++go build -o "${TARGET}" -tags pkcs11 --ldflags "${LDFLAGS}" -buildmode=pie "${SOURCE}"
>> As I mentioned in my other replies, I've never seen these warnings
>> myself. So I need to understand the configuration better.
>>
>> Since I've never seen this before, my first reaction is that any
>> change of the flags to include buildmode=pie needs to be conditional
>> on some other distro feature that is enabled in your configuration.
> Most likely the security flags at play. Could also be that you don't
> have the check enabled. At any rate I agree the details need to be
> captured in the commit log.
>
> MarkA

Yes.  This is caused by security flags -pie -fpie,  but this flags are 
enabled by default now.

below workaround can also make these warning disappear.
SECURITY_CFLAGS_pn-docker = "${SECURITY_NOPIE_CFLAGS}" 
(SECURITY_NOPIE_CFLAGS ?= "-no-pie -fno-PIE")
SECURITY_LDFLAGS_pn-docker = ""

>
>> Bruce
>>
>>> +
>>> + ln -sf "$(basename "${TARGET}")" build/docker
>>> +--
>>> +2.7.4
>>> +
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


