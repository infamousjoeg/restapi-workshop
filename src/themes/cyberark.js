export default {
    fonts: {
        body: '"Source Sans Pro", sans-serif',
        monospace: '"Source Code Pro", monospace',
    },
    colors: {
        text: '#A7C8E6',
        background: '#0f2233',
        primary: '#6aae45',
    },
    styles: {
        h1: {
            color: "#4D8FCC"
        },
        CodeSurfer: {
          pre: {
            color: "text",
            backgroundColor: "background",
            fontFamily: "body"
          },
          code: {
            backgroundColor: "background",
            fontFamily: "monospace",
            fontWeight: "500"
          },
          tokens: {
            "prolog": {
                color: "rgb(0, 0, 128)"
            },
            "comment": {
                color: "rgb(106, 153, 85)",
                fontFace: '"Victor Mono Oblique", monospace',
                fontStyle: "italic"
            },
            "builtin changed keyword": {
                color: "rgb(86, 156, 214)"
            },
            "number inserted": {
                color: "rgb(181, 206, 168)"
            },
            "constant": {
                color: "rgb(100, 102, 149)"
            },
            "attr-name variable": {
                color: "rgb(156, 220, 254)"
            },
            "deleted string attr-value": {
                color: "rgb(206, 145, 120)"
            },
            "selector": {
                color: "rgb(215, 186, 125)"
            },
            "tag": {
                color: "rgb(78, 201, 176)"
            },
            "punctuation operator": {
                color: "rgb(212, 212, 212)"
            },
            "function": {
                color: "rgb(220, 220, 170)"
            },
            "class-name": {
                color: "rgb(78, 201, 176)"
            },
            "char": {
                color: "rgb(209, 105, 105)"
            }
          },
          title: {
            backgroundColor: "background",
            color: "#4D8FCC",
            fontFamily: "body"
          },
          subtitle: {
            color: "#d6deeb",
            backgroundColor: "rgba(10,10,10,0.9)",
            fontFamily: "body"
          }
        }
      }
}