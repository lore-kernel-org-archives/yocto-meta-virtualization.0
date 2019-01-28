Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9BAD0E00C88; Sun, 27 Jan 2019 23:14:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18F5FE0048C
	for <meta-virtualization@yoctoproject.org>;
	Sun, 27 Jan 2019 23:14:53 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0S7EXQr010604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 27 Jan 2019 23:14:43 -0800
Received: from [128.224.163.204] (128.224.163.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Sun, 27 Jan 2019 23:14:22 -0800
To: <mark.asselstine@windriver.com>, Bruce Ashfield
	<bruce.ashfield@windriver.com>
References: <1543355289-16095-1-git-send-email-mark.asselstine@windriver.com>
	<b58b948f-ffe0-e02b-daeb-512361b2aa2a@windriver.com>
	<CAPuovEJ5zLrOJZs88f3S1ydenUbhay6Rv-dDRBfu1c7jXQ3__Q@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <37b1a77c-933a-793f-82e4-1d2e002780bd@windriver.com>
Date: Mon, 28 Jan 2019 15:14:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAPuovEJ5zLrOJZs88f3S1ydenUbhay6Rv-dDRBfu1c7jXQ3__Q@mail.gmail.com>
X-Originating-IP: [128.224.163.204]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: uprev from 2.10.0 to 2.10.1
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
X-List-Received-Date: Mon, 28 Jan 2019 07:14:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 01/28/2019 10:12 AM, Mark Asselstine wrote:
> On Sun, Jan 27, 2019 at 8:36 PM Hongzhi, Song
> <hongzhi.song@windriver.com> wrote:
>> Hi Mark,
>>
>> Which tests have you run for ovswitch. I want to update ovswitch to 2.11
>> which will fix issue.
>>
>> I have run ptest which executed 2764 cases, and 320 failed, 86 skipped.
>>
>> Do I have to run other tests?
> I usually rely on the ptests results and then I do a networking test
> with OverC (the cube-vrf makes use of OVS), though the ptests should
> be enough.

Hi Mark,

The ptest detailed results between ovs2.11 and ovs2.10 are almost 
consistent,
except that ovs2.11 adds some other cases.

And the total result:

  version: OVS2.11
  ERROR: 2765 tests were run,
  318 failed (1 expected failure).
  85 tests were skipped.

  version: OVS2.10
  ERROR: 2662 tests were run,
  311 failed (1 expected failure).
  85 tests were skipped.

The failed tests are also py2 related ptests as yours.

At last, could you tell me how to do a networking test with overc to 
validate ovs?

Thanks,
Hongzhi


> Unfortunately I didn't document the ptest results for the
> last few uprevs, the last time I did document the results in the
> commit log was with commit 1fd1ff3720140baa3680d795f6d97597e5113e90.
> Maybe what you can do is run the ptests with the current release and
> then run them again with the 2.11 uprev and ensure they are similar.
>
> The tests that usually FAIL are the py2 related ptests as I usually
> only have py3 on my images.
>
> MarkA
>
>
>>
>> Thanks,
>>
>> Hongzhi
>>
>>
>>
>> On 11/28/2018 05:48 AM, Mark Asselstine wrote:
>>> Pickup the latest security and bug fixes for openvswitch.
>>>
>>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>>> ---
>>>    ...nvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch} | 0
>>>    recipes-networking/openvswitch/openvswitch_git.bb                     | 4 ++--
>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>    rename recipes-networking/openvswitch/openvswitch-git/{openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch => openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch} (100%)
>>>
>>> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch
>>> similarity index 100%
>>> rename from recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch
>>> rename to recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch
>>> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
>>> index a930933..b8bbb3a 100644
>>> --- a/recipes-networking/openvswitch/openvswitch_git.bb
>>> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
>>> @@ -14,11 +14,11 @@ RDEPENDS_${PN}-ptest += "\
>>>        "
>>>
>>>    S = "${WORKDIR}/git"
>>> -PV = "2.10.0+${SRCREV}"
>>> +PV = "2.10.1+${SRCREV}"
>>>
>>>    FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>>>
>>> -SRCREV = "5563e309b80bbea9bff538e71ecfd7e5e538bab9"
>>> +SRCREV = "78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e"
>>>    SRC_URI = "file://openvswitch-switch \
>>>               file://openvswitch-switch-setup \
>>>               file://openvswitch-testcontroller \
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization


