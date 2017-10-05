Return-Path: <mark.hatle@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81426E00D7F; Thu,  5 Oct 2017 09:33:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D60B1E00C77
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 09:33:44 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v95GXce6013223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 5 Oct 2017 09:33:39 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 5 Oct 2017 09:33:37 -0700
To: Paul Barker <pbarker@toganlabs.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
References: <20170930030617.21104-1-Qi.Chen@windriver.com>
	<CADkTA4NNPF4v4nArrR94Wcxp+kJi3c-5WXinU=qrqjxp2AQruA@mail.gmail.com>
	<CAPyrkgzrqg_XnGwByBz_uiP_r9kXixT9Dkk_jwoPkwtx=2mcJg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <d1eed4a8-fbf6-bc93-c517-07c6f8dfc946@windriver.com>
Date: Thu, 5 Oct 2017 11:33:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAPyrkgzrqg_XnGwByBz_uiP_r9kXixT9Dkk_jwoPkwtx=2mcJg@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V4 1/3] sanity-meta-virt.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Thu, 05 Oct 2017 16:33:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/5/17 11:15 AM, Paul Barker wrote:
> On Mon, Oct 2, 2017 at 6:12 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> v4 is merged.
>>
>> Bruce
>>
>> On Fri, Sep 29, 2017 at 11:06 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>>> Add a new class, sanity-meta-virt.bbclass, to check for whether necessary
>>> settings are available for bbappend files in this layer to be effective,
>>> and warn users if not.
>>>
>>> In addition, a variable SKIP_SANITY_BBAPPEND_CHECK is added to enable users
>>> to explicitly skip the checking to avoid unwanted warnings.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>  classes/sanity-meta-virt.bbclass | 10 ++++++++++
>>>  conf/layer.conf                  |  4 ++++
>>>  2 files changed, 14 insertions(+)
>>>  create mode 100644 classes/sanity-meta-virt.bbclass
>>>
>>> diff --git a/classes/sanity-meta-virt.bbclass b/classes/sanity-meta-virt.bbclass
>>> new file mode 100644
>>> index 0000000..bd2b717
>>> --- /dev/null
>>> +++ b/classes/sanity-meta-virt.bbclass
>>> @@ -0,0 +1,10 @@
>>> +addhandler virt_bbappend_distrocheck
>>> +virt_bbappend_distrocheck[eventmask] = "bb.event.ConfigParsed"
>>> +python virt_bbappend_distrocheck() {
>>> +    skip_check = e.data.getVar('SKIP_SANITY_BBAPPEND_CHECK') == "1"
>>> +    if 'virtualization' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
>>> +        bb.warn("You have included the meta-virtualization layer, but \
>>> +'virtualization' has not been enabled in your DISTRO_FEATURES. Some bbappend files \
>>> +may not take effect. See the meta-virtualization README for details on enabling \
>>> +virtualization support.")
>>> +}
>>> diff --git a/conf/layer.conf b/conf/layer.conf
>>> index be08a98..51ca8ee 100644
>>> --- a/conf/layer.conf
>>> +++ b/conf/layer.conf
>>> @@ -22,3 +22,7 @@ require conf/distro/include/virt_security_flags.inc
>>>
>>>  PREFERRED_PROVIDER_virtual/runc ?= "runc-docker"
>>>  PREFERRED_PROVIDER_virtual/containerd ?= "containerd-docker"
>>> +
>>> +# Sanity check for meta-virtualization layer.
>>> +# Setting SKIP_SANITY_BBAPPEND_CHECK to "1" would skip the bbappend files check.
>>> +INHERIT += "sanity-meta-virt"
>>> --
>>> 2.11.0
>>>
> 
> I'm getting this new warning up to 4 times on each bitbake invocation:
> twice before the "Parsing recipes" line, once after the "Executing
> SetScene Tasks" line (if present) and once after the "Executing
> RunQueue Tasks" line.

Multiple times should get fixed.  This can be done by setting a value in the
event handler that the message has already been printed.

d.setVar('SKIP_SANITY_BBAPPEND_CHECK', '1')

...

--Mark

> It's also totally irrelevant for users of a distro like ours (Oryx
> Linux) which includes meta-virtualization for runc, docker or other
> related tools but doesn't use kvm or xen.
> 
> I guess I can set SKIP_SANITY_BBAPPEND_CHECK in our distro config but
> this sounds like a universal skip for all sanity bbappend checks - is
> this intended? Or does this variable just apply to the check in this
> layer? If it's specific to this layer I think it needs a better name.
> 
> Thanks,
> 


