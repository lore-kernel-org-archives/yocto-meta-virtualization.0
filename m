Return-Path: <Daniel.Badea@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7846E00A21; Tue, 30 Jun 2015 09:52:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 497D5E009A7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jun 2015 09:52:37 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5UGqYge023639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Jun 2015 09:52:35 -0700 (PDT)
Received: from daniel (128.224.21.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 30 Jun 2015 09:52:34 -0700
From: Daniel Badea <daniel.badea@windriver.com>
To: "'Bruce Ashfield'" <bruce.ashfield@gmail.com>
References: <001701d0a2a0$ec4b2880$c4e17980$@windriver.com>	<CADkTA4Ox8xXXxk3tZhK_RWJ=UjER-uwQ0tbEBhxusGtaaGxkaw@mail.gmail.com>
	<CADkTA4NFt2=TOJ+OXd4ygr-R2W+kfJYorEKV4RWZX-oorN4A9w@mail.gmail.com>
In-Reply-To: <CADkTA4NFt2=TOJ+OXd4ygr-R2W+kfJYorEKV4RWZX-oorN4A9w@mail.gmail.com>
Date: Tue, 30 Jun 2015 19:52:20 +0300
Message-ID: <006901d0b355$29ab7940$7d026bc0$@windriver.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHG0QZkfoBf5JOdh7PeFmlcBfwzZAKW4QtQArNE3USdrrYqEA==
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] tgt: update version to 1.0.37
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
X-List-Received-Date: Tue, 30 Jun 2015 16:52:42 -0000
X-Groupsio-MsgNum: 1151
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_006A_01D0B36E.4EF8FF60"
Content-Language: en-us

------=_NextPart_000_006A_01D0B36E.4EF8FF60
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I don't have the workspace anymore so I can't run git send-email.
Attached a file with the patch content so Outlook doesn't word wrap.

-Daniel

-----Original Message-----
From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]=20
Sent: Friday, June 26, 2015 4:10 PM
To: Daniel Badea
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] tgt: update version to 1.0.37

ping. Any luck with that update ?

Bruce

On Wed, Jun 10, 2015 at 4:34 PM, Bruce Ashfield =
<bruce.ashfield@gmail.com> wrote:
> I tried to apply this .. but your mailer has corrupted the patch.
>
> While it is simple, and I could fix it .. there's much more value in=20
> getting your workflow fixed.
>
> The headers show that this was sent with outlook, which likely caused=20
> the corruption.
>
> The README has the information for using git-send-email:
>
> -------------------------------
> Send pull requests, patches, comments or questions to=20
> meta-virtualization@yoctoproject.org
>
> When sending single patches, please using something like:
> 'git send-email -1 --to meta-virtualization@yoctoproject.org
> --subject-prefix=3Dmeta-virtualization][PATCH'
> -------------------------------
>
> If you did send this with git, then we need to figure out what else=20
> may have corrupted it.
>
> Bruce
>
> On Tue, Jun 9, 2015 at 6:42 AM, Daniel Badea =
<daniel.badea@windriver.com> wrote:
>> Signed-off-by: Daniel Badea <daniel.badea@windriver.com>
>> ---
>>  meta-openstack/recipes-support/tgt/tgt_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb
>> b/meta-openstack/recipes-support/tgt/tgt_git.bb
>> index 7796418..fe34858 100644
>> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
>> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
>> @@ -4,8 +4,8 @@ LICENSE =3D "GPLv2"
>>  LIC_FILES_CHKSUM =3D
>> =
"file://scripts/tgtd.spec;beginline=3D7;endline=3D7;md5=3D21c19ea7dad0464=
8b
>> 9c2f791
>> b6e29b4c"
>>  DEPENDS =3D "sg3-utils"
>>
>> -SRCREV =3D "0ee382bab57a8ecd9ece18d511bd098298478409"
>> -PV =3D "1.0.36+git${SRCPV}"
>> +SRCREV =3D "3f779c0338fa7a97d5d0defbdb3ad06167b791d3"
>> +PV =3D "1.0.37+git${SRCPV}"
>>  PR =3D "r0"
>>
>>  SRC_URI =3D "git://github.com/fujita/tgt.git \
>> --
>> 2.1.0
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end"



--
"Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end"

------=_NextPart_000_006A_01D0B36E.4EF8FF60
Content-Type: application/octet-stream; name="tgt_update_to_1.0.37.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="tgt_update_to_1.0.37.patch"

Signed-off-by: Daniel Badea <daniel.badea@windriver.com>
---
 meta-openstack/recipes-support/tgt/tgt_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack=
/recipes-support/tgt/tgt_git.bb
index 7796418..fe34858 100644
--- a/meta-openstack/recipes-support/tgt/tgt_git.bb
+++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
@@ -4,8 +4,8 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://scripts/tgtd.spec;beginline=3D7;endline=3D7;m=
d5=3D21c19ea7dad04648b9c2f791b6e29b4c"
 DEPENDS =3D "sg3-utils"

-SRCREV =3D "0ee382bab57a8ecd9ece18d511bd098298478409"
-PV =3D "1.0.36+git${SRCPV}"
+SRCREV =3D "3f779c0338fa7a97d5d0defbdb3ad06167b791d3"
+PV =3D "1.0.37+git${SRCPV}"
 PR =3D "r0"

 SRC_URI =3D "git://github.com/fujita/tgt.git \
--
2.1.0


------=_NextPart_000_006A_01D0B36E.4EF8FF60--
