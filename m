Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8799BE00D05; Wed, 27 Feb 2019 19:40:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06010E00CEE
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Feb 2019 19:40:37 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1S3ebYm012526
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Feb 2019 19:40:37 -0800 (PST)
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Wed, 27 Feb 2019 19:40:37 -0800
To: <meta-virtualization@yoctoproject.org>
References: <1551317288-33865-1-git-send-email-dengke.du@windriver.com>
	<CADkTA4PzpWUgQ1WRww0UDDorQ+kEE_eErcxWuVd1KoVQKfef7A@mail.gmail.com>
	<027606aa-c676-d47b-1c50-11140d009838@windriver.com>
From: ddu <dengke.du@windriver.com>
Message-ID: <44e075f7-90ac-5234-30dc-3b50478463b2@windriver.com>
Date: Thu, 28 Feb 2019 11:40:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <027606aa-c676-d47b-1c50-11140d009838@windriver.com>
X-Originating-IP: [128.224.162.184]
Subject: Re: [PATCH V2] criu: fix host gcc can't recognized option -fmacro-prefix-map
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
X-List-Received-Date: Thu, 28 Feb 2019 03:40:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Sorry for my little words for V2, I will add more next time.

Dengke

在 2019/2/28 上午11:37, ddu 写道:
>
> 在 2019/2/28 上午11:29, Bruce Ashfield 写道:
>> On Wed, Feb 27, 2019 at 8:09 PM Dengke Du <dengke.du@windriver.com> 
>> wrote:
>>> Generally, our host gcc version below 8.0, but cross toolchain in yocto
>>> above 8.0, now 8.3, the option "macro-prefix-map" coming from 8.0, 
>>> so if
>>> the host gcc below 8.0, it can't unrecognized the option 
>>> "macro-prefix-map".
>>>
>>> In criu source code, the HOSTCFLAGS coming from CFLAGS:
>>> https://github.com/checkpoint-restore/criu/blob/criu-dev/Makefile#L17
>>> In yocto project, the CFLAGS coming from the cross toolchain, 
>>> containing
>>> the "-fmacro-prefix-map" default, so we should use the BUILD_CFLAGS, it
>>> contains the flags that used for host building.
>> What's the difference from v1 ?
>>
>> Bruce
>
> Hi bruce
>
> V1 have two lines.
>
>>
>>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>>> ---
>>>   recipes-containers/criu/criu_git.bb | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/recipes-containers/criu/criu_git.bb 
>>> b/recipes-containers/criu/criu_git.bb
>>> index 45195ea..123f6a3 100644
>>> --- a/recipes-containers/criu/criu_git.bb
>>> +++ b/recipes-containers/criu/criu_git.bb
>>> @@ -54,6 +54,7 @@ export C_INCLUDE_PATH="${STAGING_INCDIR}/libnl3"
>>>
>>>   export BUILD_SYS
>>>   export HOST_SYS
>>> +export HOSTCFLAGS = "${BUILD_CFLAGS}"
>>>
>>>   inherit setuptools
>>>
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

