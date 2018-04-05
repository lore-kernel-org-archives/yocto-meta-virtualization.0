Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6AF5CE00ADB; Thu,  5 Apr 2018 07:14:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.49 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA1D4E00708
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Apr 2018 07:14:14 -0700 (PDT)
Received: by mail-wm0-f49.google.com with SMTP id p9so6102676wmc.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Apr 2018 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6cnBtzImi2OU8mUoIOL0jFVktphHZNt6moNayTia78o=;
	b=PdburKvHVlmAsJtQnPz94Tb7byXon/NWi+DEBDHPywk5lE6M0J9eqigPkhu8uzbExm
	iLzBSSxxrmVXNQI8YYXT1WKRnotq0LBnRjeyk7KU/qvFem+TX7s17Wp0zYIFliyc02uo
	eQ0ZzZ93oIZm4TfRfu+63kaED33/1ktjr/1sBv+W0O5bHr4BFzYOVMjXSsaGLhnPAO18
	SLFR8DAlhLgAg8wSdLDOEQ4kfB93EvUe7vFS5Al2i/l2eN9H4S0Ia49qeZSuPtBTwsQu
	n/cutYKK5gvBXV9KnffTAywsvyCstvIjG1pSoS54A0akdKqtMbT2YQMeovUCWBX+lYbw
	GEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6cnBtzImi2OU8mUoIOL0jFVktphHZNt6moNayTia78o=;
	b=rCTEIx0HhP/bmCiRoStyq3komE8J8yYLL1G5NYYwt7l3vxzCwe3vbZ/Xa4qMk2tSs1
	Hoh+vKWktNMsJQ8fbi0K0Nl7nWvaBQLag8ErOIxdu1S04hL867cKVbwPZfm083T+mnC+
	9hvM5Yhr5ciew4U2et6EKo2Hv2odmvvHGFLjNzDZ6Be3hDZ/JcvNYPFWsbhs9/zIrMzi
	4CvaxomxXURokmcW+sSWjs8OqvPhJDZCjf6UZfmz8lhAL8ZiMh1ySiG0oRKyv0Vd/mVV
	w0DFF48X0Skc5rgpg36MrxcGbJP4yjUpJjmm9OQJz+hl1Atk4UwItBfZAW7dVn8x0NwP
	UVyg==
X-Gm-Message-State: ALQs6tDLFYujvWaefHYufBOv5QtSpuiSt6/h0FUgop5XsYqkX7bvpv81
	WfsYIT7RtP+rj5bNC1DkM7eH6jVXkwRFyDED7R0=
X-Google-Smtp-Source: AIpwx493AnhqFTl2IhGvI9PPX4xiKeoQswnkT7AfIq2Baf0GRMsEyXPhnIAs6sEMl3DAmSuQy6E9eTxh9i2kbD7HaxQ=
X-Received: by 10.46.154.145 with SMTP id p17mr13956007lji.28.1522937653577;
	Thu, 05 Apr 2018 07:14:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 5 Apr 2018 07:14:13 -0700 (PDT)
In-Reply-To: <af590e1be5cf41549bd49691863a771a@xch-rcd-011.cisco.com>
References: <CADkTA4OCesBQoAPuUOtBB=kzZ38hwH0HNVY=d68ciBe8Fsrp4A@mail.gmail.com>
	<7209206599d5475fae12e84333947025@xch-rcd-011.cisco.com>
	<CADkTA4NkaZfVjiKe64s8ZEgt2UsJ4LOZCm2m8fDPZkYVAPGg9w@mail.gmail.com>
	<e042d783b2f34993b6db371c8ff1760f@xch-rcd-011.cisco.com>
	<CADkTA4NCE2QnnkvA7+0FUYG3Wf=Y73moeU8e5rQMCzAB-_V1OQ@mail.gmail.com>
	<3fd5560f842540be9fbead290ade1792@xch-rcd-011.cisco.com>
	<CADkTA4MDXyUDJGOkQec9d1y7JpsOPuKKx5VxhWbhYQGqXMVawA@mail.gmail.com>
	<af590e1be5cf41549bd49691863a771a@xch-rcd-011.cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Apr 2018 10:14:13 -0400
Message-ID: <CADkTA4OfAKVShbu-QhDrGHJ6uQq5PgeOGfgME5OBJ5ZK_ZBzBg@mail.gmail.com>
To: "Shakthi Pradeep (tpradeep)" <tpradeep@cisco.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: RFT/FYI: docker/containerd/runc uprevs pushed to master
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
X-List-Received-Date: Thu, 05 Apr 2018 14:14:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 5, 2018 at 9:32 AM, Shakthi Pradeep (tpradeep)
<tpradeep@cisco.com> wrote:
> Hello Bruce,
>
> I am actually working on a repo from Third Party. So here things are little outdated.
>
> I found some info from http://git.yoctoproject.org
>
> I am currently using Docker 1.13.0 which was committed on 2017-01-20
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recipes-containers/docker?id=0b631bf01487d3d1be0c91ea7749168fb3c47dcb
>
> I need to migrate to 18.03.0 which you committed 3 days ago
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recipes-containers/docker?id=a5074cecf18faea1a325c8ac9220d2df41250af5
>
> If I take recipe from above commit and update my workspace, will all the dependencies migrate to latest automatically?

Nope. You'd need to pull in all the updates that I recently pushed for
the dependencies, or you'll end up with runtime errors.
Also note, that due to the different go versions and build
infrastructure in oe-core, there's no guarantee that those new recipes
will build properly on an older baseline.

Bruce

>
> Regards,
> Shakthi
>
> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: Thursday, April 05, 2018 6:46 PM
> To: Shakthi Pradeep (tpradeep) <tpradeep@cisco.com>
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] RFT/FYI: docker/containerd/runc uprevs pushed to master
>
> root@cube-server:~# docker --version
> Docker version 18.03.0, build 0f1bb353423e
>
> If you are building meta-virt master, the update should happen automatically since the PV of the updated recipe is higher than the old one. All the dependencies will follow after that.
>
> Bruce
>
> On Thu, Apr 5, 2018 at 9:02 AM, Shakthi Pradeep (tpradeep) <tpradeep@cisco.com> wrote:
>> Hello Bruce,
>>
>> Which version of Docker are you running.
>>
>> I just noticed I am running Docker 1.13.1 which is too old.
>>
>> How do I migrate to latest version of Docker & also corresponding dependencies.
>>
>> Regards,
>> Shakthi
>>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Wednesday, April 04, 2018 6:45 PM
>> To: Shakthi Pradeep (tpradeep) <tpradeep@cisco.com>
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] RFT/FYI: docker/containerd/runc
>> uprevs pushed to master
>>
>> Excellent news.
>>
>> Yes, everything is in master of meta-virtualization now. That way it will have time to soak a bit before the upcoming release.
>>
>> Cheers,
>>
>> Bruce
>>
>> On Wed, Apr 4, 2018 at 8:32 AM, Shakthi Pradeep (tpradeep) <tpradeep@cisco.com> wrote:
>>> Hello Bruce,
>>>
>>> Yes I was missing the bbappend for kernel config. Got it working after I wrote the mail to you.
>>>
>>> Are your changes committed to git repo? Is it in the master branch of Yocto?
>>>
>>> Regards,
>>> Shakthi
>>>
>>> -----Original Message-----
>>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>>> Sent: Wednesday, April 04, 2018 5:57 PM
>>> To: Shakthi Pradeep (tpradeep) <tpradeep@cisco.com>
>>> Cc: meta-virtualization@yoctoproject.org
>>> Subject: Re: [meta-virtualization] RFT/FYI: docker/containerd/runc
>>> uprevs pushed to master
>>>
>>> On Wed, Apr 4, 2018 at 12:57 AM, Shakthi Pradeep (tpradeep) <tpradeep@cisco.com> wrote:
>>>> Hello Bruce,
>>>>
>>>>
>>>>
>>>> Timing is Perfect !!!
>>>>
>>>>
>>>>
>>>> I am currently trying to get Docker CE to work with Yocto. I could
>>>> include the Docker executable in ISO but when I run it I get some errors.
>>>>
>>>>
>>>>
>>>> When I boot the image looks like Docker service start is failing due
>>>> to missing kernel modules. Please refer attached screenshot and
>>>> below error log.
>>>
>>> Do you have a bbappend for your 4.8 kernel that adds the docker configuration fragments ?
>>>
>>> That's the most likely reason for the issues.
>>>
>>> I was able to run a whole suite of tests against 4.12, 4.14 and 4.15 so those kernels + fragments are known to work.
>>>
>>> Bruce
>>>
>>>>
>>>>
>>>>
>>>> * docker.service - Docker Application Container Engine
>>>>
>>>>    Loaded: loaded (/lib/systemd/system/docker.service; enabled;
>>>> vendor
>>>> preset: enabled)
>>>>
>>>>    Active: failed (Result: exit-code) since Tue 2018-04-03 13:17:51
>>>> UTC; 17min ago
>>>>
>>>>      Docs: https://docs.docker.com
>>>>
>>>>   Process: 317 ExecStart=/usr/bin/dockerd -H fd:// (code=exited,
>>>> status=1/FAILURE)
>>>>
>>>> Main PID: 317 (code=exited, status=1/FAILURE)
>>>>
>>>>
>>>>
>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>>>> time="2018-04-03T13:17:51.035178755Z" level=warning msg="Running
>>>> modprobe xt_conntrack failed with message: `modprobe: WARNING:
>>>> Module xt_conntrack not found in directory
>>>> /lib/modules/4.8.24-WR9.0.0.10_standard`, error: exit status 1"
>>>>
>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>>>> time="2018-04-03T13:17:51.040727372Z" level=info msg="Firewalld running:
>>>> false"
>>>>
>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>>>> time="2018-04-03T13:17:51.170575344Z" level=warning msg="Could not
>>>> load necessary modules for IPSEC rules: Running modprobe xfrm_user
>>>> failed with
>>>> message: `modprobe: WARNING: Module xfrm_user not found in directory
>>>> /lib/modules/4.8.24-WR9.0.0.10_standard`, error: exit status 1"
>>>>
>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>>>> time="2018-04-03T13:17:51.172397913Z" level=info msg="Default bridge
>>>> (docker0) is assigned with an IP address 172.17.0.0/16. Daemon
>>>> option --bip can be used to set a preferred IP address"
>>>>
>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]: Error starting daemon:
>>>> Error initializing network controller: Error creating default "bridge" network:
>>>> Failed to Setup IP tables: Unable to enable ACCEPT INCOMING rule:
>>>> (iptables
>>>> failed: iptables --wait -I FORWARD -o docker0 -m conntrack --ctstate
>>>> RELATED,ESTABLISHED -j ACCEPT: iptables: No chain/target/match by that name.
>>>>
>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:  (exit status 1))
>>>>
>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: Main
>>>> process exited, code=exited, status=1/FAILURE
>>>>
>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: Failed to start Docker
>>>> Application Container Engine.
>>>>
>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: Unit
>>>> entered failed state.
>>>>
>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: Failed with
>>>> result 'exit-code'.
>>>>
>>>>
>>>>
>>>> Regards,
>>>>
>>>> Shakthi
>>>>
>>>>
>>>>
>>>> -----Original Message-----
>>>> From: meta-virtualization-bounces@yoctoproject.org
>>>> [mailto:meta-virtualization-bounces@yoctoproject.org] On Behalf Of
>>>> Bruce Ashfield
>>>> Sent: Wednesday, April 04, 2018 8:44 AM
>>>> To: meta-virtualization@yoctoproject.org
>>>> Subject: [meta-virtualization] RFT/FYI: docker/containerd/runc
>>>> uprevs pushed to master
>>>>
>>>>
>>>>
>>>> Hi all,
>>>>
>>>>
>>>>
>>>> After spending a few days de-tangling the
>>>> moby/docker/runc/containerd and oe-core go infrastructure changes, I
>>>> was able to run docker/runc/containerd through a system/stress test and everything seems to be working.
>>>>
>>>>
>>>>
>>>> There were a few regressions that I worked through, as well as
>>>> build/packaging changes, but I'm no longer seeing any issues and all
>>>> the patches/functionality have been carried forward.
>>>>
>>>>
>>>>
>>>> One thing of note is that the docker and open containers containerd
>>>> split/fork is no longer an issue, so I've modified the default to be
>>>> the opencontainers variant. Similarly, the docker and opencontainers
>>>> runc are very similar. I've kept both variants of both recipes for
>>>> now, since I'd like to track things for a bit longer before
>>>> declaring the split unnecessary.
>>>>
>>>>
>>>>
>>>> Also for those that care, I created a reference docker-ce recipe
>>>> that tracks the docker-ce repo versus the components themselves.
>>>> Right now it is reference only, since it needs a bit more work, but
>>>> I wanted to get it out there, in case someone really cares about
>>>> docker-ce (I don't really, but someone might!).
>>>>
>>>>
>>>>
>>>> Summary: I just pushed the following changes to master:
>>>>
>>>>
>>>>
>>>>   d7d310ae4113 meta-virt: prefer containerd-opencontainers
>>>>
>>>>   935e3d969ef1 containerd: uprev to v1.0.2
>>>>
>>>>   f5fbfa8ac4db docker-ce: introduce reference recipe/build
>>>>
>>>>   a5074cecf18f docker: uprev to 18.03.0
>>>>
>>>>   e3d960f4fcd9 runc: uprev to 1.0.0-rc5
>>>>
>>>>
>>>>
>>>> If anyone sees regressions, build or architecture issues .. report
>>>> them to me (and the list) and we'll get them fixed up.
>>>>
>>>>
>>>>
>>>> Cheers,
>>>>
>>>>
>>>>
>>>> Bruce
>>>>
>>>>
>>>>
>>>> --
>>>>
>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>>> thee at its end"
>>>>
>>>> --
>>>>
>>>> _______________________________________________
>>>>
>>>> meta-virtualization mailing list
>>>>
>>>> meta-virtualization@yoctoproject.org
>>>>
>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

