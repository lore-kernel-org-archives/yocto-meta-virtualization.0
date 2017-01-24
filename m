Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DD13E00BAF; Tue, 24 Jan 2017 05:41:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7DC7E00BAB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Jan 2017 05:41:13 -0800 (PST)
Received: by mail-yw0-f196.google.com with SMTP id u68so20380876ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Jan 2017 05:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qzA/PkdN6D9S4+oKTUvnwpchn4KTPjLWz4oWQ95tRAk=;
	b=gHmLsgcePTqgdXvUSx4HjlX3TJvnfYK1UP9BmY0nbg6HOkSKGLSY1EhtOYNuZtaav6
	JeQ6P+lismaaqA+wBUNSPPBiPltqx0qUjEJdrqhiWR16k8IuXAhAn0W1qkORMnKFhmCz
	dSL2kRPAq48YzS33fZMUK7AJnGhxZwwABFJy6xyIZ9lpgZlbt/kmgInU+nfIy9yNzFm/
	GQ3Cz6uRHYCu3uxT6wHymb8TD8S0T3HVXjdXJ2oJGgt3Z2ts11oQFmomRidHluYufXhP
	Hh+Wi2sbgB+LXFSwcqeV5jdlnktjzE1nTq4rQtyFvnDyZBAZaIuiCqgwrdJo2DgHflW6
	UG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=qzA/PkdN6D9S4+oKTUvnwpchn4KTPjLWz4oWQ95tRAk=;
	b=HCeqpVdove5WBOkxq8xVlXYiCTUdhnHwpMDnPK6G8BUgujyA+1d4vUXB2Bb9p/2dyF
	IK16c0N//GikI+tZPPXdhw1LnTm36qZmMjMCyq2DGmg1NRlIzMb1GB1pgx6qZWjVNsdg
	cYV1EOM7CjnPcrpoNb4a7auNlBEHNvBfZAtfKMX5RlYzA0bNRVrsiJYt/qa4n4RggsL6
	605A+SFSxqqZfYi3rykiYl6pruhVKktt9Zr+kD/OQBM0MR9Yi0gxcINMQr1nHHAjFY88
	3eOoFfqk3hmDOAXgSt3qa6tbzXDEOhLGs255fpEF6XrJvY9uEdeNmfsSANDf0aLL+HjT
	Xoqg==
X-Gm-Message-State: AIkVDXJggDzQyyBRnLJcAvKNqAZMoiP6zXw1ZotQi8pXZjZbBZ9lerPQ+QNrJ7B7A5QYx96Z9gIfuUbNqMwHJw==
X-Received: by 10.129.125.84 with SMTP id y81mr25250843ywc.120.1485265272834; 
	Tue, 24 Jan 2017 05:41:12 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.99 with HTTP; Tue, 24 Jan 2017 05:41:12 -0800 (PST)
In-Reply-To: <1485236865-905-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1485236865-905-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 24 Jan 2017 08:41:12 -0500
X-Google-Sender-Auth: mjkYmFCexRMDkwaqe7ifcy15PZo
Message-ID: <CAPuovELK2_wnnah9+f=e3K5cR0t4eiOxKa8ZtKHzgQAe8xv-Cw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH] python-oslo.serialization: 1.11.0 -> 2.13.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2017 13:41:16 -0000
X-Groupsio-MsgNum: 2385
Content-Type: multipart/mixed; boundary=001a114928bafc54ee0546d7449e

--001a114928bafc54ee0546d7449e
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 24, 2017 at 12:47 AM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-oslo.serialization from 1.11.0 to 2.13.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

You missed updating the RDEPENDS per the requirements.txt. These should now be:
RDEPENDS_${PN} += " \
       python-pbr \
       python-six \
       python-msgpack-python \
       python-oslo.utils \
       python-pytz \
       "

I have attached a script I use to help parse the requirements.txt
file. You can use it for example:

 ./requires.py tmp/work/core2-64-poky-linux/python-oslo.serialization/2.13.0+gitAUTOINC+be02fdbebc-r0/git/requirements.txt

Please send a v2 with the updated RDEPENDS.

Mark


>  .../recipes-devtools/python/python-oslo.serialization_git.bb        | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> index 1bf11f4..6d5801b 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> @@ -5,10 +5,10 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
>
>  SRCNAME = "oslo.serialization"
> -SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
> +SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
>
> -PV = "1.11.0+git${SRCPV}"
> -SRCREV = "a8626ea9f9e37bf4129096cc2295f63516fb768e"
> +PV = "2.13.0+git${SRCPV}"
> +SRCREV = "be02fdbebc2d9f92a959aa34e0cb5a30934dfa0d"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

--001a114928bafc54ee0546d7449e
Content-Type: text/x-python; charset=US-ASCII; name="requires.py"
Content-Disposition: attachment; filename="requires.py"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iybkiws50

IyEvdXNyL2Jpbi9weXRob24KCmltcG9ydCBvcwppbXBvcnQgcmUKaW1wb3J0IHN5cwppbXBvcnQg
b3BlcmF0b3IKaW1wb3J0IGNvbGxlY3Rpb25zCmZyb20gZGlzdHV0aWxzLnZlcnNpb24gaW1wb3J0
IExvb3NlVmVyc2lvbiwgU3RyaWN0VmVyc2lvbgoKcmVxdWlyZXMgPSBzeXMuYXJndlsxXQoKb3Bz
ID0geyI+PSI6IG9wZXJhdG9yLmdlLAogICAgICAgIjw9Ijogb3BlcmF0b3IubGUsCiAgICAgICAi
PT0iOiBvcGVyYXRvci5lcSwKICAgICAgICIhPSI6IG9wZXJhdG9yLm5lLAogICAgICAgIjwiOiBv
cGVyYXRvci5sdCwKICAgICAgICI+Ijogb3BlcmF0b3IuZ3QsCn0KCmRlZiBwYXJzZV92ZXJzaW9u
X2luZm8obGluZSk6CiAgICAjIHJlbW92ZSBhbnkgY29tbWVudCBmcm9tIHRoZSBlbmQgb2YgdGhl
IGxpbmUKICAgIHN0cmlwcGVkID0gbGluZS5zcGxpdCgnIycpWzBdCgogICAgIyBnZXQgcGFja2Fn
ZSBuYW1lCiAgICBwa2cgPSByZS5zcGxpdCgnPnw8fD18IScsIHN0cmlwcGVkKVswXS5sb3dlcigp
LnN0cmlwKCkKICAgIGlmIG5vdCByZS5tYXRjaCgiXnB5dGhvbi0iLCBwa2cpOgogICAgICAgIHBr
ZyA9ICJweXRob24tJXMiICUgcGtnCgogICAgIyBnZXQgdmVyc2lvbiBzdHJpbmcKICAgIHJhd19w
a2cgPSByZS5zcGxpdCgnPnw8fD18IScsIHN0cmlwcGVkKVswXQogICAgdnN0ciA9IHN0cmlwcGVk
LnNwbGl0KHJhd19wa2cpWzE6XVswXS5zdHJpcCgpCgogICAgcmV0dXJuIChwa2csdnN0cikKCmRl
ZiBwcmludF9yZGVwZW5kcyhkZXBzKToKICAgIHByaW50KCJSREVQRU5EU18ke1BOfSArPSBcIiBc
XCIpCiAgICBmb3IgZGVwIGluIGRlcHM6CiAgICAgICAgcHJpbnQoIiAgICAgICAgJXMgXFwiICUg
ZGVwKQogICAgcHJpbnQoIiAgICAgICAgXCIiKQoKZGVmIGNoZWNrX3JkZXBlbmRzX3ZlcnNpb25z
KGRlcHMpOgogICAgZm9yIGRlcCBpbiBkZXBzOgogICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0
cygidG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC8lcyIgJSBkZXApOgogICAgICAgICAgICBw
cmludCgiVW5hYmxlIHRvIGZpbmQgJyVzJyIgJSBkZXApCiAgICAgICAgICAgIHJldHVybgoKICAg
ICAgICBmb3VuZF92ZXIgPSBvcy5saXN0ZGlyKCJ0bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
LyVzLyIgJSBkZXApWzBdCiAgICAgICAgIyBEcm9wIHRoZSBQUgogICAgICAgIGZvdW5kX3ZlciA9
IGZvdW5kX3Zlci5zcGxpdCgnLScpWzotMV1bMF0KICAgICAgICAjIERyb3AgdGhlICcrZ2l0JHtT
UkNQVn0nCiAgICAgICAgZm91bmRfdmVyID0gcmUuY29tcGlsZSgiXCtnaXQuKiIpLnNwbGl0KGZv
dW5kX3ZlcilbMF0KCiAgICAgICAgY2hlY2sgPSAiT0siOwogICAgICAgIHJlcV92ZXIgPSBkZXBz
W2RlcF0KICAgICAgICBmb3IgY29uZGl0aW9uIGluIHJlcV92ZXIuc3BsaXQoJywnKToKICAgICAg
ICAgICAgY29uZGl0aW9uID0gY29uZGl0aW9uLnN0cmlwKCkKICAgICAgICAgICAgbSA9IHJlLm1h
dGNoKCdeKD49fDw9fCE9fD09fDx8PiknLCBjb25kaXRpb24pCiAgICAgICAgICAgIGlmIG06CiAg
ICAgICAgICAgICAgICBvcGVyYXRpb24gPSBjb25kaXRpb25bOm0uZW5kKCldCiAgICAgICAgICAg
ICAgICB2ZXJzaW9uID0gY29uZGl0aW9uW20uZW5kKCk6XS5zdHJpcCgpCiAgICAgICAgICAgICAg
ICBpZiBub3Qgb3BzW29wZXJhdGlvbl0oTG9vc2VWZXJzaW9uKGZvdW5kX3ZlcikgLExvb3NlVmVy
c2lvbih2ZXJzaW9uKSk6CiAgICAgICAgICAgICAgICAgICAgY2hlY2sgPSAiRkFJTEVEIgogICAg
ICAgICAgICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICBj
aGVjayA9ICJVTktOT1dOIgogICAgICAgICAgICAgICAgYnJlYWsKCiAgICAgICAgcHJpbnQoIiVz
ICVzIDwtPiAlcyAgICVzIiAlIChkZXAsIGZvdW5kX3ZlciwgcmVxX3ZlciwgY2hlY2spKQoKZGVw
ZW5kZW5jaWVzID0gY29sbGVjdGlvbnMuT3JkZXJlZERpY3QoKQp3aXRoIG9wZW4ocmVxdWlyZXMs
ICdyJykgYXMgZmluOgogICAgZm9yIGxpbmUgaW4gZmluOgogICAgICAgIGlmIG5vdCBsaW5lLnN0
YXJ0c3dpdGgoJyMnKSBhbmQgbm90IGxpbmUuc3RyaXAoKSA9PSAiIjoKICAgICAgICAgICAgKHBr
ZywgdnN0cikgPSBwYXJzZV92ZXJzaW9uX2luZm8obGluZSkKICAgICAgICAgICAgZGVwZW5kZW5j
aWVzW3BrZ10gPSB2c3RyCiAgICBwcmludF9yZGVwZW5kcyhkZXBlbmRlbmNpZXMpCiAgICBjaGVj
a19yZGVwZW5kc192ZXJzaW9ucyhkZXBlbmRlbmNpZXMpCg==

--001a114928bafc54ee0546d7449e--
