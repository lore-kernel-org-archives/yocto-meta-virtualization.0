Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8949E008EE; Thu, 29 Mar 2018 05:48:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE914E008BF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 05:48:48 -0700 (PDT)
Received: by mail-yw0-f181.google.com with SMTP id c20so1897121ywa.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=y4I9IMxqcmMdadqXJgrBWJc3bzNFj7LQtF7UvjOIX9Y=;
	b=gDGQZhQ/HlQoDho0AW9JqT93fRI1dk6POoa0X6itnOiwk6Cxt2085/YHcPSVXqbTyx
	5sQaSk691ZAqGKjw7yK4T9cfF/wwS+i/SzFDO17ah1r228930B35cww8R0zfjLt9X0z0
	IE7txzy3Rtwsay9GSP1G0gwyEPZi70aVP9ICHCTbPju77z3xLrOLgCaOMMNbZz+g6KqD
	LCp1lMab5wGO5a16HBiqZQsQv/MuwV/V/JM2cuJTNIX6J9gXo+vEhkmUv7DRpEHLcq3c
	qMz5Eh961wpORNzu9/CnFJUypdQAwXOm3eTLXYYlfqP9JvCogZ1cBGab9pwREapKtyWo
	PvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=y4I9IMxqcmMdadqXJgrBWJc3bzNFj7LQtF7UvjOIX9Y=;
	b=W7eQvlH7diomEFhWDuM84ku4Cuoj3ND18A4WmUz6oPwNuEZiTnFRiCvUrn2QEe2Ijc
	NHzm61mR3L1nmgNsVGL3pnsVpuMJgBfH5aaRsU7tDr8RXV3VO5hLZi/CGYOSoFGCed2K
	1On8N6JmEOjzTE55VvbRgBy0lNgeOdpr9URaEC3O4UaUVsVF7oCIAhfXT50XCwUaBBWf
	vGNx1QSW3OZyXNnMhNakHRnXtmz05HC7k2DRlYAVIuFhcaKx4PlyF4fm6wmJA2tiIUHZ
	WoFHebn1U6kbSRBYzlzlLZzYsRh4G60uAKjEUP3/BfmPp2RUpVisiLvTRAQYxb2i1sEi
	ze7w==
X-Gm-Message-State: AElRT7GL4Quw8ldwfgexDxODoD41k1BmlPRip7A9Y/HtYG4ueNRVDjQr
	YAF5Nrdfjxrvk7J3Hedy1wI3ZMwdWeePXc7AGjDEvQ==
X-Google-Smtp-Source: AIpwx48SQpreC8KFpyW74UgbLkXRPVMEaHBq9WwQXn8V8MzYyaSzTSNiboHCSVjKcKm2UdfNelCOLg9Ji+O5btKzHyg=
X-Received: by 10.13.226.206 with SMTP id l197mr4655551ywe.490.1522327727688; 
	Thu, 29 Mar 2018 05:48:47 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP; Thu, 29 Mar 2018 05:48:47
	-0700 (PDT)
In-Reply-To: <CAPuovE+SGSwYLxcjQkJF7cRzY1cfEkUb3nvKC6gPkT6-RAMjbA@mail.gmail.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAPuovE+SGSwYLxcjQkJF7cRzY1cfEkUb3nvKC6gPkT6-RAMjbA@mail.gmail.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Thu, 29 Mar 2018 08:48:47 -0400
X-Google-Sender-Auth: 0W_GPs4YEkyewtTWeY4Hua7mWxo
Message-ID: <CAPuovEJ-ymwWqfDjJiWi4ijuRDcvBg=qPmN04V9d5g2Pj83YLA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-heatclient: 1.9.0 -> 1.14.0
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
X-List-Received-Date: Thu, 29 Mar 2018 12:48:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 23, 2018 at 9:11 AM, M. Asselstine <asselsm@mcmaster.ca> wrote:
> Bruce, I will have a look at these on Monday to ensure they don't
> conflict with the uprev to OpenStack pike release. Unfortunately I
> don't have time today.
>
> On Thu, Mar 22, 2018 at 11:28 PM, Huang Qiyu
> <huangqy.fnst@cn.fujitsu.com> wrote:
>> Upgrade python-heatclient from 1.9.0 to 1.14.0.
>>
>> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> ---

Bruce,

This should be OK to merge.

Mark


>>  meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>> index 6653b37..baa1c2c 100644
>> --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>> +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>> @@ -28,8 +28,8 @@ SRCNAME = "heatclient"
>>
>>  SRC_URI = "git://github.com/openstack/python-heatclient.git;branch=master"
>>
>> -PV = "1.9.0+git${SRCPV}"
>> -SRCREV = "b80166d848dd26718cfe0627bfec22774213616b"
>> +PV = "1.14.0+git${SRCPV}"
>> +SRCREV = "2ce6aa19a3a8936bc7c9737efadacbb4ae737dab"
>>  S = "${WORKDIR}/git"
>>
>>  inherit setuptools
>> --
>> 2.7.4
>>
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization

