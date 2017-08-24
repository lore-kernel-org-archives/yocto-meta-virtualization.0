Return-Path: <tiniuc.alexandru@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D2AFE00A39; Thu, 24 Aug 2017 02:33:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (tiniuc.alexandru[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.43 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22234E00726
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 02:33:10 -0700 (PDT)
Received: by mail-lf0-f43.google.com with SMTP id a9so337993lfh.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 02:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=PfMgnFMhoL0wIERTadiOVY/xUsNTK+0Zdy1aXdjij5A=;
	b=fn7xScM0qd1eZzUNB4VY9LUE4fJfIjB566F3vGB3SPVjJvgf756h2VPO3DrwiBt19a
	+CIAXu7cRYOUKXFduwnGZgbvFoMUGawznoNmaqCzT2oze712FMSBoUr0+leYZeUopknU
	hWbAHPYaqF5Q/WfU0qUOq0B0NxrWUxEwUZCLaKZ9uYhUd0GtQsNa3LKuiXznx7losgGd
	NcmW4Zq623Z+MT4Bl6ikAhtA8v6C07R+wjgAPsvJTSwMcfX9e4iIIsQh4aMShKo1R+yV
	8xdjzdAwrr16nhqLEqcDEcejyvMo46GndEplhimrpHO0Y212YmPj0f7iUtC3OLv589BR
	bmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=PfMgnFMhoL0wIERTadiOVY/xUsNTK+0Zdy1aXdjij5A=;
	b=EwOfbizSIsf05q1mSwHJDx4k0PQIiM76JMEzB3T7MdafaCOX24KyJLI7+BbRAH+MWt
	I/3Iztx863+hwPKPXu3QxZZUHpNNqD/6AOHAEqYqmf23p7CPNv5ChtUVpmL15h7lO9vI
	u6Ae+Jo44zxCiiQfQ0DuEi/04mOb5YvDW461WJagZZUPOb47hk++R4y1rXrm9HhJDAjc
	hQczfqTb9MBa1aZVNpnGBtTpQN87IiVTm/fDwSWqxNOGOYnNzk33jrqwKH15+my3gJmy
	sjuOGSxKzX6kYZrcdopZgVLWW5z4NZ36szhXlcFgPw6oV1en+YL7waBqTx9DoTYTs+ny
	mcQw==
X-Gm-Message-State: AHYfb5j6m/fE2C5xXDynPBS3qxkcXCiEVs+/HEJp9etj+4Esgu8hc4AY
	gAa9XEnV9MfMO0dsOfMDO4OWbcxnL2Cg590=
X-Received: by 10.25.39.207 with SMTP id n198mr1806103lfn.261.1503567189356;
	Thu, 24 Aug 2017 02:33:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.5.81 with HTTP; Thu, 24 Aug 2017 02:33:08 -0700 (PDT)
From: Tiniuc Alexandru <tiniuc.alexandru@gmail.com>
Date: Thu, 24 Aug 2017 10:33:08 +0100
Message-ID: <CANRoRsdz21DJS-_rsOcjWW1HtA2VZZLQDJnWjwASeMtrYaiS+A@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: [question] Sending a pull request
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
X-List-Received-Date: Thu, 24 Aug 2017 09:33:12 -0000
Content-Type: multipart/alternative; boundary="001a11403ca037b90f05577c8425"

--001a11403ca037b90f05577c8425
Content-Type: text/plain; charset="UTF-8"

I have been trying to send a pull request for a couple of days, and I have
had little luck. The create-pull-request script fails and informs me that
the remote URL seems incorrect (git://
git.yoctoproject.org/meta-virtualization is the URL I am using.).

Sending the patch directly using git send-email, as advised in the README
file, doesn't seem to deliver the messages. My logfile mentions that the
email was sent, but it hasn't appeared in the mailing list, nor in my inbox
(I am automatically CC'd)

Would you mind telling me what I am doing wrong? This is my first time
using a terminal email client and I would be more than happy to learn how
to do it properly.

Many thanks,
Alexandru Tiniuc

--001a11403ca037b90f05577c8425
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have been trying to send a pull request for a couple of =
days, and I have had little luck. The create-pull-request script fails and =
informs me that the remote URL seems incorrect (git://<a href=3D"http://git=
.yoctoproject.org/meta-virtualization">git.yoctoproject.org/meta-virtualiza=
tion</a> is the URL I am using.).=C2=A0<div><br></div><div>Sending the patc=
h directly using git send-email, as advised in the README file, doesn&#39;t=
 seem to deliver the messages. My logfile mentions that the email was sent,=
 but it hasn&#39;t appeared in the mailing list, nor in my inbox (I am auto=
matically CC&#39;d)</div><div><br></div><div>Would you mind telling me what=
 I am doing wrong? This is my first time using a terminal email client and =
I would be more than happy to learn how to do it properly.</div><div><br></=
div><div>Many thanks,</div><div>Alexandru Tiniuc</div></div>

--001a11403ca037b90f05577c8425--
