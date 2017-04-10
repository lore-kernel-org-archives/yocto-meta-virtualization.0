Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11891E00A96; Mon, 10 Apr 2017 00:59:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.42 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B2F5E00A31
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Apr 2017 00:59:01 -0700 (PDT)
Received: by mail-oi0-f42.google.com with SMTP id f22so9029494oib.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Apr 2017 00:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=y3aKkw4yKEfEs/0ilCc4PQu1RMHIEak0SrEzDDjplyo=;
	b=awlHsRXIdaECMWbPEnwVE87Jll50dTCuPJoWunOI0MxlOlHyK5H2iaYF3xpcyFskov
	VLxIBr3D0XMDkUyVjOgP/2tl2WHoCig3fOiV816ka1PH5M5YibeZZZ7xG08Du0ImKWqM
	wtn42V8HMiK8HXJZJEFokkE2RlU85ypB3bm7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=y3aKkw4yKEfEs/0ilCc4PQu1RMHIEak0SrEzDDjplyo=;
	b=WNfJ6zzQuf8hz1G5Iu6DlkTI2qWdKQPnm+QL1vTzJCwQoVnt2NVowm+8gwf6No87CP
	UWxUKKI+/dwy2xOFFRohZSuH3r81UnQfVJ/FsU2o7VgdsjQZasQdtEPOeMwLURS4SX81
	ThKI1TykV/sRXOVAG48Lp7G+7J6H876xUB85HVdY7YIA0h0GVXKRTcC7wrKaQofcJcdE
	Bqv8hmqHzfccXZ1UXEgo6Q6GDcH7VezuYLheF8/oG86JVpmTHVLDvQhkezz4ATlCfrFj
	zShuLoSxEllt/RoAF3BH57zzX1hi68ULB5e/Y9qBStY1PzKICyACzwr1TFMRI3hTOQMW
	fYeQ==
X-Gm-Message-State: AFeK/H3YYs8WbPDbfsV3Wv4YmpONWnJhm/kC6kZ6ITTJrjOI1yHh3eA+hR4lb574JZ4sVL36QaYXDBbrigyELL46
X-Received: by 10.202.192.65 with SMTP id q62mr16088452oif.124.1491811140925; 
	Mon, 10 Apr 2017 00:59:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.43.92 with HTTP; Mon, 10 Apr 2017 00:59:00 -0700 (PDT)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Mon, 10 Apr 2017 09:59:00 +0200
Message-ID: <CAFL6qn4COY_d-uRBe-ausjbW+7MOUkU6gU8kkqkHj_gokxxmEw@mail.gmail.com>
To: meta-virtualization@yoctoproject.org, yocto@yoctoproject.org, 
	joe_macdonald@mentor.com, Philip Tricca <flihp@twobit.us>,
	mark.hatle@windriver.com
Subject: No recipes available for meta-selinux and meta-virtualization layers
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
X-List-Received-Date: Mon, 10 Apr 2017 07:59:03 -0000
Content-Type: multipart/alternative; boundary=001a113dd53a209fc7054ccb5987

--001a113dd53a209fc7054ccb5987
Content-Type: text/plain; charset=UTF-8

Hi,

I have tried to build a core-image-minimal image with master branch of
Yocto and I have added the meta-virtualization layer and it's dependency
layers in order to have virtualization functionalities enabled when
creating the image.

The problem is that the bitbake execution fails due to there are missing
some recipes for meta-selinux and meta-virtualization layers. This is the
message that I can see in the terminal when it fails the execution:

pello@pello-VirtualBox:/opt/yocto_GE/yocto_master_xen/poky/build$ bitbake
core-image-minimal
Parsing recipes: 100%
|##################################################################################|
Time: 0:09:00
Parsing of 1981 .bb files complete (0 cached, 1981 parsed). 2752 targets,
204 skipped, 0 masked, 0 errors.
ERROR: No recipes available for:

/opt/yocto_GE/yocto_master_xen/poky/meta-selinux/recipes-devtools/rpm/rpm_5.4.16.bbappend

/opt/yocto_GE/yocto_master_xen/poky/meta-selinux/recipes-extended/findutils/findutils_4.2.31.bbappend

/opt/yocto_GE/yocto_master_xen/poky/meta-virtualization/recipes-kernel/linux/linux-yocto_4.8.bbappend

Summary: There was 1 ERROR message shown, returning a non-zero exit code.


How can be solved this error? Are you planned to update some patch for
solving this issue?

Looking forward to your answer,
Best regards,
Pello

--001a113dd53a209fc7054ccb5987
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I have tried to build a core-image-=
minimal image with master branch of Yocto and I have added the meta-virtual=
ization layer and it&#39;s dependency layers in order to have virtualizatio=
n functionalities enabled when creating the image.</div><div><br></div><div=
>The problem is that the bitbake execution fails due to there are missing s=
ome recipes for meta-selinux and meta-virtualization layers. This is the me=
ssage that I can see in the terminal when it fails the execution:</div><div=
><br></div><div><div>pello@pello-VirtualBox:/opt/yocto_GE/yocto_master_xen/=
poky/build$ bitbake core-image-minimal</div><div>Parsing recipes: 100% |###=
###########################################################################=
####| Time: 0:09:00</div><div>Parsing of 1981 .bb files complete (0 cached,=
 1981 parsed). 2752 targets, 204 skipped, 0 masked, 0 errors.</div><div>ERR=
OR: No recipes available for:</div><div>=C2=A0 /opt/yocto_GE/yocto_master_x=
en/poky/meta-selinux/recipes-devtools/rpm/rpm_5.4.16.bbappend</div><div>=C2=
=A0 /opt/yocto_GE/yocto_master_xen/poky/meta-selinux/recipes-extended/findu=
tils/findutils_4.2.31.bbappend</div><div>=C2=A0 /opt/yocto_GE/yocto_master_=
xen/poky/meta-virtualization/recipes-kernel/linux/linux-yocto_4.8.bbappend<=
/div><div><br></div><div>Summary: There was 1 ERROR message shown, returnin=
g a non-zero exit code.</div></div><div><br></div><div><br></div><div>How c=
an be solved this error? Are you planned to update some patch for solving t=
his issue?</div><div><br></div><div>Looking forward to your answer,</div><d=
iv>Best regards,</div><div>Pello</div></div>

--001a113dd53a209fc7054ccb5987--
