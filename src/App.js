function App() {
    return (
        <div
            style={{
                height: '100vh',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
            }}
        >
            <img
                src={"/novohrad.jpg"}
                alt={"novohrad"}
                style={{
                    maxWidth: '80%',
                    maxHeight: '80%',
                    objectFit: 'contain',
                }}
            />
        </div>
    );
}

export default App;