Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85C15E00CF4; Mon,  6 May 2019 18:36:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED56FE00C37
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 May 2019 18:36:15 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x471aEE3029143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 May 2019 18:36:14 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 6 May 2019 18:36:13 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20190506021718.128811-1-kai.kang@windriver.com>
	<CADkTA4PJwC-UD5E3w7yQiEuoHo6=F9GqFbshEc3pDyZscJBeNA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <3bde01eb-980a-8770-bcfa-f357a5f8cb28@windriver.com>
Date: Tue, 7 May 2019 09:32:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4PJwC-UD5E3w7yQiEuoHo6=F9GqFbshEc3pDyZscJBeNA@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH v2 0/3] Fix dependency issues for librdmacm and glusterfs
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
X-List-Received-Date: Tue, 07 May 2019 01:36:16 -0000
Content-Type: multipart/alternative;
	boundary="------------2DB063C86C6F6C34739A5D3E"
Content-Language: en-US

--------------2DB063C86C6F6C34739A5D3E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2019/5/7 上午3:49, Bruce Ashfield wrote:
>
>
> On Sun, May 5, 2019 at 10:17 PM <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     Re-send v2:
>     * Maybe wrong recipient in previous v2 thread, Bruce didn't
>     recieve the 3rd patch. So re-send.
>
>
> thanks. I got all three this time.
>
> They are now merged.


Thanks.

Kai


>
> Bruce
>
>
>     Kai Kang (3):
>       glusterfs: remove PACKAGECONFIG libibverbs for arm 32 and mips
>       librdmacm: set imcompatible with arm 32 and mips arches
>       layer.conf: depends on meta-filesystems
>
>      conf/layer.conf                               | 2 +-
>      recipes-extended/glusterfs/glusterfs.inc      | 3 +++
>      recipes-extended/librdmacm/librdmacm_1.1.0.bb
>     <http://librdmacm_1.1.0.bb> | 3 +++
>      3 files changed, 7 insertions(+), 1 deletion(-)
>
>     -- 
>     2.20.0
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

-- 
Kai Kang


--------------2DB063C86C6F6C34739A5D3E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2019/5/7 上午3:49, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4PJwC-UD5E3w7yQiEuoHo6=F9GqFbshEc3pDyZscJBeNA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Sun, May 5, 2019 at 10:17
            PM &lt;<a href="mailto:kai.kang@windriver.com"
              moz-do-not-send="true">kai.kang@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">From: Kai Kang &lt;<a
              href="mailto:kai.kang@windriver.com" target="_blank"
              moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
            <br>
            Re-send v2:<br>
            * Maybe wrong recipient in previous v2 thread, Bruce didn't
            recieve the 3rd patch. So re-send.<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">thanks. I
              got all three this time.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">They are
              now merged.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks.</p>
    <p>Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CADkTA4PJwC-UD5E3w7yQiEuoHo6=F9GqFbshEc3pDyZscJBeNA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Bruce</div>
            <br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            Kai Kang (3):<br>
              glusterfs: remove PACKAGECONFIG libibverbs for arm 32 and
            mips<br>
              librdmacm: set imcompatible with arm 32 and mips arches<br>
              layer.conf: depends on meta-filesystems<br>
            <br>
             conf/layer.conf                               | 2 +-<br>
             recipes-extended/glusterfs/glusterfs.inc      | 3 +++<br>
             recipes-extended/librdmacm/<a
              href="http://librdmacm_1.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">librdmacm_1.1.0.bb</a>
            | 3 +++<br>
             3 files changed, 7 insertions(+), 1 deletion(-)<br>
            <br>
            -- <br>
            2.20.0<br>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">- Thou shalt not follow
          the NULL pointer, for chaos and madness await thee at its end<br>
          - "Use the force Harry" - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang</pre>
  </body>
</html>

--------------2DB063C86C6F6C34739A5D3E--
