Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8EF96E00B67; Mon, 16 Oct 2017 17:50:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.169 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.169 listed in list.dnswl.org]
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57F85E00A62
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 17:50:50 -0700 (PDT)
Received: by mail-qt0-f169.google.com with SMTP id k31so189971qta.6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 17:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YHMtdRNzvtvBo6ZAqJ7Sdusgntnh34LxD9Ps+ai/t2c=;
	b=YcH6s5UGApRxi0m/Pk3FwF8+0oREKpUDpfnbco35zMgprTutheJ0o2vtfL/9j3WdAr
	RtCzs7I5TyaTrRPCeZe9F6T8+nLR+RJJffW/8k7VY6uqEO2PmckByvm2gUm7BtDMtbvU
	m13mY1thpCmXt0+w1eI6y/WrE5ZKSVZ29QKQfhKqfk9UQJvbGZtAJ5L4TDv/ZHaCgVKb
	/IzSv2LRjZPsMDjFl005Afc9aYyiVDKNAT2UEyna1Z7tHGYAnwXK02tuMMolQoINrR7C
	XN7rPBqOSP5zptP+s30mVvMBpc9O5JAzu4ZK6t36n9itDcC5Vq+Uhh1v5SGgeuK1w25/
	WO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YHMtdRNzvtvBo6ZAqJ7Sdusgntnh34LxD9Ps+ai/t2c=;
	b=YbzATmiVAdy0iS2A06qL0yKTrz+mAw4QQxRUOiDPsN3TEw1PP9JstoinaNd3DNO1np
	xxjcd7A1cw+nTXq5aTMWiPy9Y3RzLAcfzaQPHEGTKJgsGzsSP761mFoxBUQfZV6xrXAf
	dBuPtF2UYSObGCLdz951Jc1OgVc+bfhMyKxOrdqPQvWT0MDvwX7F66rMEbUUWpYyZWgw
	rXUCgoZk8mW7DLbmzpRzbwHeN5Xct4X/3Gni+hyE7qOvPLFLU3tlMnXZao5qfO2VjwQH
	7yuYdUUIdQJnnuyT33ArmiUMOuMjVwQUi0+NtBfmJouD6T6OCDF72y/PNbCXwYYPiI1a
	iJ8A==
X-Gm-Message-State: AMCzsaXIIMAfIffdUVxlVjySqq3AGNv+MQgKifzPBPWcXJxHuP6vmTGn
	ubvDBjmqLj5PyAdGzlFT5xdh3sTzOzUSFV5GnsM=
X-Google-Smtp-Source: AOwi7QBXqpS3ZL/u6ipcp5tyqtXnIUdq/NqECFyNlMn6ee/Huwj3d/xaQiIF3k+qBnJAGwvP4sU9KrPw6v4pg9xaomE=
X-Received: by 10.200.48.103 with SMTP id g36mr16941209qte.289.1508201450147; 
	Mon, 16 Oct 2017 17:50:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Mon, 16 Oct 2017 17:50:49 -0700 (PDT)
In-Reply-To: <1508188679-11528-1-git-send-email-ricardo@opensourcefoundries.com>
References: <1508188679-11528-1-git-send-email-ricardo@opensourcefoundries.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Oct 2017 20:50:49 -0400
Message-ID: <CADkTA4NDa9GFu1vv420trVz+wL=Fr7tUHgM7NZk1jNoUGNztkg@mail.gmail.com>
To: Ricardo Salveti <ricardo@opensourcefoundries.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] runc-docker_git: use SRCREV instead of SRCREV_runc-docker
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
X-List-Received-Date: Tue, 17 Oct 2017 00:50:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 16, 2017 at 5:17 PM, Ricardo Salveti
<ricardo@opensourcefoundries.com> wrote:
> runc.inc sets PV based on "${RUNC_VERSION}+git${SRCREV}", which is
> set correctly by runc-opencontainers but not by runc-docker (PV was set
> to 1.0.0-rc3+gitINVALID-r0 instead of using the SRCREV hash).

Then I'll revert the .inc

As I mentioned before, I'm keeping the named SRCREVs. I didn't notice that on
the way in.

Cheers,

Bruce

>
> Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index 9db48ee..6ef4d2c 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,7 +2,7 @@ include runc.inc
>
>  # Note: this rev is before the required protocol field, update when all components
>  #       have been updated to match.
> -SRCREV_runc-docker = "9d6821d1b53908e249487741eccd567249ca1d99"
> +SRCREV = "9d6821d1b53908e249487741eccd567249ca1d99"
>  SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
>             file://0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch \
>             file://0002-Remove-Platform-as-no-longer-in-OCI-spec.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

