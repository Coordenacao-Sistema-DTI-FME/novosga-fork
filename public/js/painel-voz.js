(function () {
    'use strict';

    console.log('painel-voz.js carregado');

    let vozes = [];

    function carregarVozes() {
        vozes = window.speechSynthesis.getVoices();

        console.log(
            '[painel-voz] Vozes disponíveis:',
            vozes.map(v => `${v.name} (${v.lang})`)
        );
    }

    carregarVozes();

    if (typeof window.speechSynthesis !== 'undefined' && window.speechSynthesis.onvoiceschanged !== undefined) {
        window.speechSynthesis.onvoiceschanged = carregarVozes;
    }

    window.PainelVoz = {

        falarChamada(chamada) {
            if (!chamada || !chamada.senha) {
                return;
            }

            // Tenta recarregar as vozes caso o array esteja vazio
            if (!vozes || vozes.length === 0) {
                vozes = window.speechSynthesis.getVoices();
            }

            const senha = chamada.senha || '';
            const local = chamada.local || '';
            const numeroLocal = chamada.numeroLocal || '';

            console.log('[painel-voz] Falando:', {
                senha: senha,
                local: local,
                numeroLocal: numeroLocal,
            });

            const texto = `Senha ${senha}, dirigir-se ao ${local} ${numeroLocal}`;

            const utterance = new SpeechSynthesisUtterance(texto);

            utterance.lang = 'pt-BR';
            utterance.rate = 0.72;
            utterance.pitch = 1;
            utterance.volume = 1;

            // Busca priorizando o Rudolph
            const vozSelecionada = vozes.find(voz => {
                const nome = voz.name.toLowerCase();
                const lang = voz.lang.replace('_', '-').toLowerCase();

                const ePtBr = lang.includes('pt-br') || lang.includes('pt');

                return ePtBr && (
                    nome.includes('rudolph') ||
                    nome.includes('francisca') ||
                    nome.includes('daniel') ||
                    nome.includes('maria') ||
                    nome.includes('female')
                );
            });

            if (vozSelecionada) {
                utterance.voice = vozSelecionada;
                console.log('[painel-voz] Voz selecionada:', vozSelecionada.name);
            } else {
                console.warn('[painel-voz] Nenhuma voz específica encontrada. Usando padrão do sistema.');
            }

            window.speechSynthesis.cancel();
            window.speechSynthesis.speak(utterance);
        },
    };
})();