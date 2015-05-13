Return-Path: <edwingate8@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A545AE0095C; Wed, 13 May 2015 10:47:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (edwingate8[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.212.181 listed in list.dnswl.org]
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4058FE00820
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 10:47:47 -0700 (PDT)
Received: by wizk4 with SMTP id k4so209053279wiz.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 10:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=GnTtY370VBRXnnacOL32iH4bKh12aAEwed8x8mWurGU=;
	b=dtTpQkuRBuJ3zxM3CUhYoxRE9MdBeEx0JY7EpsURHYDiwVSt0FbkEEfAyIDPTQ1uEC
	GsSB+LWybiw0s/PnEuxSgFul4ToDTTZ9YS9HgZRyArnIKRiYZZDlQdrSxX5IcDTBYLdg
	aHVkXlxPBwR4eY7J1GEC6v5fGUQx/mFrU2glQ+j3LAmL3Bi0xqp3A5oDAvwVsQh1Db0H
	T4m09fPk5Mg3XUvYuP60xezTxuR4DBPiTKaqPKb3UYm3+chl5J+FMwM8YLKzV9WI0RMW
	U2uAmms8AVvX3H8DbyIgqN4f6a9U+zyBaLJYSU0kEnuWcSSHCIdDFCe6hsf1+jzX3v3e
	L3cA==
MIME-Version: 1.0
X-Received: by 10.180.37.101 with SMTP id x5mr16656536wij.74.1431539266782;
	Wed, 13 May 2015 10:47:46 -0700 (PDT)
Received: by 10.28.19.70 with HTTP; Wed, 13 May 2015 10:47:46 -0700 (PDT)
Date: Wed, 13 May 2015 10:47:46 -0700
Message-ID: <CAGMdoF=9aYsk833uVyccFt+pU09XVKB62eyCxwoCLOqj+q9yJQ@mail.gmail.com>
From: Edward Wingate <edwingate8@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: meta-cloud-services branch names
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
X-List-Received-Date: Wed, 13 May 2015 17:47:51 -0000
Content-Type: text/plain; charset=UTF-8

Why are the branch names for meta-cloud-services (kilo, juno, havana,
etc.) different than poky and most other meta- layers (daisy, dizzy,
fido, etc.)?  I'm a new Yocto user and up until now, the meta layers I
have been using have the same branch names as poky and I have been
syncing according to branch names.  Is this not necessary with
meta-cloud-services?  Thanks for your help.

