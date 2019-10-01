Return-Path: <misla011@fiu.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 195E3E00CBC; Tue,  1 Oct 2019 16:27:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB1FFE0053F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Oct 2019 16:27:06 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id 3so23959865qta.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 Oct 2019 16:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zs5G+MmLh7R/TcqjFLIaJJhZoU+HWeLryHmRfNKjExo=;
	b=s7LFjl0I+2MgG46Vq1jthE42jexiRgUBbztY5cuD0Evkykx36nrnegjGOWg+bAjaQs
	LoN1Jr08eOS3aUQvBtYTa3mawpM5qIVCq9wdRA8h6J1GDQgDgzpAmnlVcwdE4pwRdDky
	DwjlwFNxzPJAjXq2vmRce2VX0l4jr6XGVag00M9uovc/jXFhEJ91l2QlBRDd+N3i7D0F
	rny7xgYRUnc2ZjfU7iYkYUoDHdXpO4e+QduntFoh3vDxl3GRoGmtkB+fjgN7lijN8/rj
	J3ZOq8tfJXzkdYyHXXPe6ZB/DurSnXD+g+C2TnHlv/0eADYmO4av4f6/fcB3Ub1Xl+8B
	Ea0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zs5G+MmLh7R/TcqjFLIaJJhZoU+HWeLryHmRfNKjExo=;
	b=rVWrgD71bniNNVQs4KO4efMwOfEYH7+IzTrbKLqVURz89QMPOUfNT0Bmpj9aELSufU
	a1LGrHNc+vTto3dy6jLitmAmdNhkvXFWEQJ+y1c/zwcdD9WE/OHD0zt4ziTbffmYXbZT
	+kQ3/FqxiueOf7nTqG8U4kqE3b8Ci1/m04a38VWYHO2Xd3M7A11oE12aO/LRA6UOtELu
	JxgxyaQG26OVycdO0bNuX9byPy0AqdAtpBOzXTreSQg5QZ0YfaE9Kyffw08vz1hkySQu
	ZRiHbA7zhDJMMmLHLJ999/3iInPnzQ9XC/LxyKVFMp7/5tox4zIIBjjbC3jBchkJvX2Q
	w6xw==
X-Gm-Message-State: APjAAAUEtEASdwkwRh1cj5nR6oPGsk3hcxJmvukNWUpVPcIBkn1Hr2cX
	AD3kDfpo97RYoz6n573qU+i8sm8qrQP6VSqZAQdapA==
X-Google-Smtp-Source: APXvYqykARIAWWZuQ+wW8JuNkDQmmvKi3BuqcYo3fWpmU9fzd1xe3eh2gKmSnCKgBRxHvft6tBh/bJAAwjd/OeTEPzQ=
X-Received: by 2002:ac8:7502:: with SMTP id u2mr1008698qtq.216.1569972425854; 
	Tue, 01 Oct 2019 16:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190930221604.113382-1-muislam@microsoft.com>
	<CADkTA4OS+Cw4aSbYN4nNuJebtiE0NgxepsG7CyRtV5hh4-63aw@mail.gmail.com>
In-Reply-To: <CADkTA4OS+Cw4aSbYN4nNuJebtiE0NgxepsG7CyRtV5hh4-63aw@mail.gmail.com>
From: Muminul Russell <misla011@fiu.edu>
Date: Tue, 1 Oct 2019 16:26:54 -0700
Message-ID: <CAK=B8yaXUYwZHOucQAojfuSk7vxoQ92d+yEq8JU49guDA5SnTw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] kubernetes: Security fix for CVE </CVE-2018-1002105>
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
X-List-Received-Date: Tue, 01 Oct 2019 23:27:08 -0000
Content-Type: text/plain; charset="UTF-8"

The patch was failed due to the path. In the yocto build source file
location is different.

V2:
+--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go

V1:
--- a/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
++++ b/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go

On Tue, Oct 1, 2019 at 1:58 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> What's the delta from v1 ?
>
> Also, given that this isn't the final 1.16 kubernetes release, I'd
> rather version bump than apply patches.
>
> Bruce
>
>
> On Mon, Sep 30, 2019 at 6:16 PM Muminul Islam <misla011@fiu.edu> wrote:
> >
> > Signed-off-by: Muminul Islam <muislam@microsoft.com>
> > ---
> >  .../kubernetes/CVE-2018-1002105.patch         | 87 +++++++++++++++++++
> >  .../kubernetes/kubernetes_git.bb              |  1 +
> >  2 files changed, 88 insertions(+)
> >  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch
> >
> > diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch b/recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch
> > new file mode 100644
> > index 0000000..505450c
> > --- /dev/null
> > +++ b/recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch
> > @@ -0,0 +1,87 @@
> > +From b2c05ca842b97090df424e0401968ba8d7ee3ecb Mon Sep 17 00:00:00 2001
> > +From: Jordan Liggitt <liggitt@google.com>
> > +Date: Mon, 5 Nov 2018 23:50:35 -0500
> > +Subject: [PATCH] Verify backend upgraded connection
> > +Reply-To: muislam@microsoft.com
> > +
> > +Signed-off-by: Muminul Islam <muislam@microsoft.com>
> > +
> > +CVE: CVE-2018-1002105
> > +
> > +Upstream-Status: Backport
> > +---
> > + .../pkg/util/proxy/upgradeaware.go            | 37 +++++++++++++++++++
> > + 1 file changed, 37 insertions(+)
> > +
> > +diff --git a/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go b/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
> > +index 4d5cd34d48..b14819079c 100644
> > +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
> > ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
> > +@@ -17,6 +17,7 @@ limitations under the License.
> > + package proxy
> > +
> > + import (
> > ++      "bufio"
> > +       "bytes"
> > +       "context"
> > +       "fmt"
> > +@@ -269,6 +270,18 @@ func (h *UpgradeAwareHandler) tryUpgrade(w http.ResponseWriter, req *http.Reques
> > +       }
> > +       defer backendConn.Close()
> > +
> > ++      // determine the http response code from the backend by reading from rawResponse+backendConn
> > ++      rawResponseCode, headerBytes, err := getResponseCode(io.MultiReader(bytes.NewReader(rawResponse), backendConn))
> > ++      if err != nil {
> > ++              glog.V(6).Infof("Proxy connection error: %v", err)
> > ++              h.Responder.Error(w, req, err)
> > ++              return true
> > ++      }
> > ++      if len(headerBytes) > len(rawResponse) {
> > ++              // we read beyond the bytes stored in rawResponse, update rawResponse to the full set of bytes read from the backend
> > ++              rawResponse = headerBytes
> > ++      }
> > ++
> > +       // Once the connection is hijacked, the ErrorResponder will no longer work, so
> > +       // hijacking should be the last step in the upgrade.
> > +       requestHijacker, ok := w.(http.Hijacker)
> > +@@ -293,6 +306,17 @@ func (h *UpgradeAwareHandler) tryUpgrade(w http.ResponseWriter, req *http.Reques
> > +               }
> > +       }
> > +
> > ++      if rawResponseCode != http.StatusSwitchingProtocols {
> > ++              // If the backend did not upgrade the request, finish echoing the response from the backend to the client and return, closing the connection.
> > ++              glog.V(6).Infof("Proxy upgrade error, status code %d", rawResponseCode)
> > ++              _, err := io.Copy(requestHijackedConn, backendConn)
> > ++              if err != nil && !strings.Contains(err.Error(), "use of closed network connection") {
> > ++                      glog.Errorf("Error proxying data from backend to client: %v", err)
> > ++              }
> > ++              // Indicate we handled the request
> > ++              return true
> > ++      }
> > ++
> > +       // Proxy the connection. This is bidirectional, so we need a goroutine
> > +       // to copy in each direction. Once one side of the connection exits, we
> > +       // exit the function which performs cleanup and in the process closes
> > +@@ -354,6 +378,19 @@ func (h *UpgradeAwareHandler) DialForUpgrade(req *http.Request) (net.Conn, error
> > +       return dial(updatedReq, h.UpgradeTransport)
> > + }
> > +
> > ++// getResponseCode reads a http response from the given reader, returns the status code,
> > ++// the bytes read from the reader, and any error encountered
> > ++func getResponseCode(r io.Reader) (int, []byte, error) {
> > ++      rawResponse := bytes.NewBuffer(make([]byte, 0, 256))
> > ++      // Save the bytes read while reading the response headers into the rawResponse buffer
> > ++      resp, err := http.ReadResponse(bufio.NewReader(io.TeeReader(r, rawResponse)), nil)
> > ++      if err != nil {
> > ++              return 0, nil, err
> > ++      }
> > ++      // return the http status code and the raw bytes consumed from the reader in the process
> > ++      return resp.StatusCode, rawResponse.Bytes(), nil
> > ++}
> > ++
> > + // dial dials the backend at req.URL and writes req to it.
> > + func dial(req *http.Request, transport http.RoundTripper) (net.Conn, error) {
> > +       conn, err := DialURL(req.Context(), req.URL, transport)
> > +--
> > +2.23.0
> > +
> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> > index a0e0e47..b587e16 100644
> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> > @@ -12,6 +12,7 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=master;name=kuberne
> >             file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
> >             file://0001-cross-don-t-build-tests-by-default.patch \
> >             file://0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch \
> > +           file://CVE-2018-1002105.patch \
> >            "
> >
> >  DEPENDS += "rsync-native \
> > --
> > 2.23.0
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

