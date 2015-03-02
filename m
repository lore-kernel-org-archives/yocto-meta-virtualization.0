Return-Path: <rr.mausa@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E70BE00873; Mon,  2 Mar 2015 05:57:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (rr.mausa[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.43 listed in list.dnswl.org]
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44616E0086D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Mar 2015 05:57:01 -0800 (PST)
Received: by lamq1 with SMTP id q1so7225319lam.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Mar 2015 05:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=nkMqCz8PMFah5kEEhmlGIGJgNHI8AOKuL8O/gPRRnbY=;
	b=PAeou0jGgOOPPctbRx5yg1cFm92C38S8SwQAENGconphojiWqsjFPchEq57vSMjrFN
	pGbhbfvFm6hpSTmNuiJk/a56EZ43Py0LgJlfy27Xijj5l7nxLozDhM7LVcdZ1yYJz9sD
	wQcQD+bjptsl9AqPuqexd81zZCbSqxYfATKdwjIvtDzkEzaWu+0OBWIO6uFyj1JejFUh
	k0D569PXN55VKo2oamgGDEXeqHEwOzuybmBdoH6cz4JeNzHKs+QaT3Fc1hx3T0XqYJUI
	xB/io4BUkCVPa2oqDfrciq58gVfULI6roX6HS02jKQn34p/5H6l3peJGRJ0WKumjMQHS
	kWuA==
X-Received: by 10.112.141.34 with SMTP id rl2mr24167536lbb.26.1425304619409;
	Mon, 02 Mar 2015 05:56:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.26.42 with HTTP; Mon, 2 Mar 2015 05:56:36 -0800 (PST)
From: DarkWiz58 <rr.mausa@gmail.com>
Date: Mon, 2 Mar 2015 08:56:36 -0500
Message-ID: <CAPYEzVDpNnX2JZDyzurUD90uguxsnMxGbd0oE6_GGPwcGzWkhg@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: xen-image-minimal build stops near end -- file missing? Recipe line has a bug? Help.
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
X-List-Received-Date: Mon, 02 Mar 2015 13:57:04 -0000
Content-Type: multipart/alternative; boundary=001a11c3427089670605104e97d8

--001a11c3427089670605104e97d8
Content-Type: text/plain; charset=UTF-8

Running bitbake xen-image-minimal, it runs almost all the steps until
this error shows up:

DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']; DEBUG: Executing shell function
do_compile; NOTE: make -j 24 ; make: *** No targets specified and no
makefile found. Stop. ; ERROR: oe_runmake failed ; WARNING: exit code
1 from a shell command. ; ERROR: Function failed: do_compile ; ERROR:
oe_runmake failed.

As you can see, the do_compile eventually is asked to "make -j 24"
which means no target is supplied somewhere in the deep chain of
inheritances.

Does ANYONE have a clue or a fix for this????

...OR can anybody tell me what .conf settings to change to that the
xen-image-minimal will work?

-Thanks!

Bob

--001a11c3427089670605104e97d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"" id=3D"comment_text_0">Running bitbake xen-=
image-minimal, it runs almost all the steps until this error shows up:

DEBUG: SITE files [&#39;endian-little&#39;, &#39;common-linux&#39;, &#39;co=
mmon-glibc&#39;, &#39;bit-64&#39;, &#39;x86_64-linux&#39;, &#39;common&#39;=
]; DEBUG: Executing shell function do_compile; NOTE: make -j 24 ; make: ***=
 No targets specified and no makefile found. Stop. ; ERROR: oe_runmake fail=
ed ; WARNING: exit code 1 from a shell command. ; ERROR: Function failed: d=
o_compile ; ERROR: oe_runmake failed.

As you can see, the do_compile eventually is asked to &quot;make -j 24&quot=
; which means no target is supplied somewhere in the deep chain of inherita=
nces.

Does ANYONE have a clue or a fix for this????<br><br></pre><pre class=3D"" =
id=3D"comment_text_0">...OR can anybody tell me what .conf settings to chan=
ge to that the xen-image-minimal will work?<br><br></pre><pre class=3D"" id=
=3D"comment_text_0">-Thanks!<br></pre><pre class=3D"" id=3D"comment_text_0"=
>Bob<br><br></pre></div>

--001a11c3427089670605104e97d8--
