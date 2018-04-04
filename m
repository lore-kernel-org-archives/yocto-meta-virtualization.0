Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3787E00948; Wed,  4 Apr 2018 06:14:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7E0BE008A2
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Apr 2018 06:14:44 -0700 (PDT)
Received: by mail-wm0-f47.google.com with SMTP id u189so5722564wmd.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Apr 2018 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m6XxHXkmuDeNuYmdu7q5Z1Ihg8v7oUZKdmry27DZF2g=;
	b=g1CrsJRUpkqiRZpdx75uRZtyfC6yjddcMWsPDwyERZnl4FbjnvlpKlvAa2wzswgVtx
	bmHEu7STUfqjbmH5L2/jB/I2efFCyFMKm2C5zACr9qW6aonVF1ubSVA+Jsuy3Iji25bj
	dv7Uph1grs6kz4gJ/1zXb7AiyMd9xXbCioS2x6P2WOZB3TFd3pcMEefh+372p6GUIBHE
	lWZs17v7749ZVmfvAseWNDLpaZDO8x7Q1K9m/f1yUU3kTt+2kvIsUYxgA5UN9PEH7TEL
	6JDH30h6lNvdOJ90bau0O/WcgfPTI9X6SPmDnzEUbErV/Nm9DZRF2mfB3DH2dUnh1DJY
	c04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m6XxHXkmuDeNuYmdu7q5Z1Ihg8v7oUZKdmry27DZF2g=;
	b=F+qb8iMoD8tGW/Tij/j8xVNEsZKw1xd8q2bLIBfDk7qK/Y0/vxG6jVqvylaQyothBk
	CUM4Iwa1v1+yyfnkmHQuWaMbo4HunhANbQOJa878fkFpsB+T91sNpG/PaOvmxbVo9lk3
	XQmlH4DMY6qAMCkI8MGw2SbEWLXLfBEHnA3Dkwup+xBnG/ThtrIJOapnuWjA8xHsPTBu
	V6GS4kDltPhQ1GfRJdRmRlJZ2WJQkNl/n/ovg+wsWl9jF0HEmIOfSyjZqP1Saf1iyJ7F
	c5V3YxAzIsrqUJN2GyGo1Q9bj6SQN9Jqyc1Jg+aU8Tpcu7mVbV16xfbIV72K6L8eGh4/
	3uvw==
X-Gm-Message-State: AElRT7GJziYUZij9BA8ESKcZP2DKCZLp/GbohUoHmVZBjaVd+gmgz09f
	G/uwl3kcAD5TlP8Ji3HkhA486yNiJ83RpvepPYg=
X-Google-Smtp-Source: AIpwx49rMyTzKDnU+DGczidoMvArOg5zV8QQ81DcrJeSR5M75hGExS23K6ferrFN3trMnbKU5PPmrZbu3ndC5HVNfa8=
X-Received: by 10.46.23.202 with SMTP id 71mr11294387ljx.49.1522847683334;
	Wed, 04 Apr 2018 06:14:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 4 Apr 2018 06:14:42 -0700 (PDT)
In-Reply-To: <e042d783b2f34993b6db371c8ff1760f@xch-rcd-011.cisco.com>
References: <CADkTA4OCesBQoAPuUOtBB=kzZ38hwH0HNVY=d68ciBe8Fsrp4A@mail.gmail.com>
	<7209206599d5475fae12e84333947025@xch-rcd-011.cisco.com>
	<CADkTA4NkaZfVjiKe64s8ZEgt2UsJ4LOZCm2m8fDPZkYVAPGg9w@mail.gmail.com>
	<e042d783b2f34993b6db371c8ff1760f@xch-rcd-011.cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Apr 2018 09:14:42 -0400
Message-ID: <CADkTA4NCE2QnnkvA7+0FUYG3Wf=Y73moeU8e5rQMCzAB-_V1OQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Apr 2018 13:14:45 -0000
Content-Type: text/plain; charset="UTF-8"

Excellent news.

Yes, everything is in master of meta-virtualization now. That way it
will have time to soak a bit before the upcoming release.

Cheers,

Bruce

On Wed, Apr 4, 2018 at 8:32 AM, Shakthi Pradeep (tpradeep)
<tpradeep@cisco.com> wrote:
> Hello Bruce,
>
> Yes I was missing the bbappend for kernel config. Got it working after I wrote the mail to you.
>
> Are your changes committed to git repo? Is it in the master branch of Yocto?
>
> Regards,
> Shakthi
>
> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: Wednesday, April 04, 2018 5:57 PM
> To: Shakthi Pradeep (tpradeep) <tpradeep@cisco.com>
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] RFT/FYI: docker/containerd/runc uprevs pushed to master
>
> On Wed, Apr 4, 2018 at 12:57 AM, Shakthi Pradeep (tpradeep) <tpradeep@cisco.com> wrote:
>> Hello Bruce,
>>
>>
>>
>> Timing is Perfect !!!
>>
>>
>>
>> I am currently trying to get Docker CE to work with Yocto. I could
>> include the Docker executable in ISO but when I run it I get some errors.
>>
>>
>>
>> When I boot the image looks like Docker service start is failing due
>> to missing kernel modules. Please refer attached screenshot and below
>> error log.
>
> Do you have a bbappend for your 4.8 kernel that adds the docker configuration fragments ?
>
> That's the most likely reason for the issues.
>
> I was able to run a whole suite of tests against 4.12, 4.14 and 4.15 so those kernels + fragments are known to work.
>
> Bruce
>
>>
>>
>>
>> * docker.service - Docker Application Container Engine
>>
>>    Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor
>> preset: enabled)
>>
>>    Active: failed (Result: exit-code) since Tue 2018-04-03 13:17:51
>> UTC; 17min ago
>>
>>      Docs: https://docs.docker.com
>>
>>   Process: 317 ExecStart=/usr/bin/dockerd -H fd:// (code=exited,
>> status=1/FAILURE)
>>
>> Main PID: 317 (code=exited, status=1/FAILURE)
>>
>>
>>
>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>> time="2018-04-03T13:17:51.035178755Z" level=warning msg="Running
>> modprobe xt_conntrack failed with message: `modprobe: WARNING: Module
>> xt_conntrack not found in directory
>> /lib/modules/4.8.24-WR9.0.0.10_standard`, error: exit status 1"
>>
>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>> time="2018-04-03T13:17:51.040727372Z" level=info msg="Firewalld running:
>> false"
>>
>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>> time="2018-04-03T13:17:51.170575344Z" level=warning msg="Could not
>> load necessary modules for IPSEC rules: Running modprobe xfrm_user
>> failed with
>> message: `modprobe: WARNING: Module xfrm_user not found in directory
>> /lib/modules/4.8.24-WR9.0.0.10_standard`, error: exit status 1"
>>
>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>> time="2018-04-03T13:17:51.172397913Z" level=info msg="Default bridge
>> (docker0) is assigned with an IP address 172.17.0.0/16. Daemon option
>> --bip can be used to set a preferred IP address"
>>
>> Apr 03 13:17:51 intel-x86-64 dockerd[317]: Error starting daemon:
>> Error initializing network controller: Error creating default "bridge" network:
>> Failed to Setup IP tables: Unable to enable ACCEPT INCOMING rule:
>> (iptables
>> failed: iptables --wait -I FORWARD -o docker0 -m conntrack --ctstate
>> RELATED,ESTABLISHED -j ACCEPT: iptables: No chain/target/match by that name.
>>
>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:  (exit status 1))
>>
>> Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: Main process
>> exited, code=exited, status=1/FAILURE
>>
>> Apr 03 13:17:51 intel-x86-64 systemd[1]: Failed to start Docker
>> Application Container Engine.
>>
>> Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: Unit entered
>> failed state.
>>
>> Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: Failed with
>> result 'exit-code'.
>>
>>
>>
>> Regards,
>>
>> Shakthi
>>
>>
>>
>> -----Original Message-----
>> From: meta-virtualization-bounces@yoctoproject.org
>> [mailto:meta-virtualization-bounces@yoctoproject.org] On Behalf Of
>> Bruce Ashfield
>> Sent: Wednesday, April 04, 2018 8:44 AM
>> To: meta-virtualization@yoctoproject.org
>> Subject: [meta-virtualization] RFT/FYI: docker/containerd/runc uprevs
>> pushed to master
>>
>>
>>
>> Hi all,
>>
>>
>>
>> After spending a few days de-tangling the moby/docker/runc/containerd
>> and oe-core go infrastructure changes, I was able to run
>> docker/runc/containerd through a system/stress test and everything seems to be working.
>>
>>
>>
>> There were a few regressions that I worked through, as well as
>> build/packaging changes, but I'm no longer seeing any issues and all
>> the patches/functionality have been carried forward.
>>
>>
>>
>> One thing of note is that the docker and open containers containerd
>> split/fork is no longer an issue, so I've modified the default to be
>> the opencontainers variant. Similarly, the docker and opencontainers
>> runc are very similar. I've kept both variants of both recipes for
>> now, since I'd like to track things for a bit longer before declaring
>> the split unnecessary.
>>
>>
>>
>> Also for those that care, I created a reference docker-ce recipe that
>> tracks the docker-ce repo versus the components themselves.  Right now
>> it is reference only, since it needs a bit more work, but I wanted to
>> get it out there, in case someone really cares about docker-ce (I
>> don't really, but someone might!).
>>
>>
>>
>> Summary: I just pushed the following changes to master:
>>
>>
>>
>>   d7d310ae4113 meta-virt: prefer containerd-opencontainers
>>
>>   935e3d969ef1 containerd: uprev to v1.0.2
>>
>>   f5fbfa8ac4db docker-ce: introduce reference recipe/build
>>
>>   a5074cecf18f docker: uprev to 18.03.0
>>
>>   e3d960f4fcd9 runc: uprev to 1.0.0-rc5
>>
>>
>>
>> If anyone sees regressions, build or architecture issues .. report
>> them to me (and the list) and we'll get them fixed up.
>>
>>
>>
>> Cheers,
>>
>>
>>
>> Bruce
>>
>>
>>
>> --
>>
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>> --
>>
>> _______________________________________________
>>
>> meta-virtualization mailing list
>>
>> meta-virtualization@yoctoproject.org
>>
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

